// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Linq;
using System.Reflection;
using Common.Logging;
using NakedObjects.Architecture.Component;
using NakedObjects.Architecture.Configuration;
using NakedObjects.Architecture.Facet;
using NakedObjects.Architecture.Menu;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Architecture.SpecImmutable;
using NakedObjects.Core;
using NakedObjects.Core.Util;
using NakedObjects.Meta.Component;
using NakedObjects.Meta.SpecImmutable;
using NakedObjects.Util;

namespace NakedObjects.Reflect.Component {
    // This is designed to run once, single threaded at startup. It is not intended to be thread safe.
    public sealed class Reflector : IReflector {
        private static readonly ILog Log = LogManager.GetLogger(typeof(Reflector));
        private readonly IClassStrategy classStrategy;
        private readonly IReflectorConfiguration config;
        private readonly FacetDecoratorSet facetDecoratorSet;
        private readonly IMenuFactory menuFactory;
        private readonly IMetamodelBuilder initialMetamodel;
        private readonly ISet<Type> serviceTypes = new HashSet<Type>();

        public Reflector(IClassStrategy classStrategy,
                         IMetamodelBuilder metamodel,
                         IReflectorConfiguration config,
                         IMenuFactory menuFactory,
                         IFacetDecorator[] facetDecorators,
                         IFacetFactory[] facetFactories) {
            Assert.AssertNotNull(classStrategy);
            Assert.AssertNotNull(metamodel);
            Assert.AssertNotNull(config);
            Assert.AssertNotNull(menuFactory);

            this.classStrategy = classStrategy;
            this.initialMetamodel = metamodel;
            this.config = config;
            this.menuFactory = menuFactory;
            facetDecoratorSet = new FacetDecoratorSet(facetDecorators);
            FacetFactorySet = new FacetFactorySet(facetFactories);
        }

        // exposed for testing
        public IFacetDecoratorSet FacetDecoratorSet => facetDecoratorSet;

        #region IReflector Members

        public bool ConcurrencyChecking => config.ConcurrencyChecking;

        public bool IgnoreCase => config.IgnoreCase;

        public IClassStrategy ClassStrategy => classStrategy;

        public IFacetFactorySet FacetFactorySet { get; }

        //public IMetamodelBuilder Metamodel => metamodel;

        public ITypeSpecBuilder[] AllObjectSpecImmutables => initialMetamodel.AllSpecifications.Cast<ITypeSpecBuilder>().ToArray();

        public void LoadSpecificationForReturnTypes(IList<PropertyInfo> properties, Type classToIgnore, IMetamodelBuilder metamodel) {
            foreach (PropertyInfo property in properties) {
                if (property.GetGetMethod() != null && property.PropertyType != classToIgnore) {
                    LoadSpecification(property.PropertyType, metamodel);
                }
            }
        }

        public ITypeSpecBuilder LoadSpecification(Type type, IMetamodelBuilder metamodel) {
            Assert.AssertNotNull(type);
            return (ITypeSpecBuilder)metamodel.GetSpecification(type, true) ?? LoadSpecificationAndCache(type, metamodel);
        }

        public Tuple<ITypeSpecBuilder, ImmutableDictionary<Type, ITypeSpecBuilder>> LoadSpecification(Type type, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            Assert.AssertNotNull(type);
            var actualType = classStrategy.GetType(type);
            if (!metamodel.ContainsKey(actualType)) {
                return LoadSpecificationAndCache(type, metamodel);
            }

            return new Tuple<ITypeSpecBuilder, ImmutableDictionary<Type, ITypeSpecBuilder>>(metamodel[actualType], metamodel);

            //return (ITypeSpecBuilder)metamodel.GetSpecification(type, true) ?? LoadSpecificationAndCache(type, metamodel);
        }

        public T LoadSpecification<T>(Type type, IMetamodelBuilder metamodel) where T : ITypeSpecImmutable {
            var spec = LoadSpecification(type, metamodel);
            try {
                return (T)spec;
            } catch (Exception) {
                throw new ReflectionException(Log.LogAndReturn($"Specification for type {type.Name} is {spec.GetType().Name}: cannot be cast to {typeof(T).Name}"));
            }
        }

        public void Reflect() {
            Type[] s1 = config.Services;
            Type[] services = s1.ToArray();
            Type[] nonServices = GetTypesToIntrospect();

            services.ForEach(t => serviceTypes.Add(t));

            var allTypes = services.Union(nonServices).ToArray();

            InstallSpecifications(allTypes, initialMetamodel);

            PopulateAssociatedActions(s1.ToArray(), initialMetamodel);

            //Menus installed once rest of metamodel has been built:
            InstallMainMenus(initialMetamodel);
            InstallObjectMenus(initialMetamodel);
        }

        public void ReflectParallel() {
            Type[] s1 = config.Services;
            Type[] services = s1.ToArray();
            Type[] nonServices = GetTypesToIntrospect();

            services.ForEach(t => serviceTypes.Add(t));

            var allTypes = services.Union(nonServices).ToArray();

            InstallSpecificationsBis(allTypes, initialMetamodel, config);

            PopulateAssociatedActions(s1.ToArray(), initialMetamodel);

            //Menus installed once rest of metamodel has been built:
            InstallMainMenus(initialMetamodel);
            InstallObjectMenus(initialMetamodel);
        }

        #endregion

        private Type EnsureGenericTypeIsComplete(Type type) {
            if (type.IsGenericType && !type.IsConstructedGenericType) {
                var genericType = type.GetGenericTypeDefinition();
                var genericParms = genericType.GetGenericArguments().Select(a => typeof (Object)).ToArray();

                return type.GetGenericTypeDefinition().MakeGenericType(genericParms);
            }
            return type;
        }

        private Type[] GetTypesToIntrospect() {
            var types = config.TypesToIntrospect.Select(EnsureGenericTypeIsComplete);
            var systemTypes = config.SupportedSystemTypes.Select(EnsureGenericTypeIsComplete);
            return types.Union(systemTypes).ToArray();
        }

        private ImmutableDictionary<Type, ITypeSpecBuilder> GetSpecBis(Type type) {
            var mm = new Dictionary<Type, ITypeSpecBuilder>().ToImmutableDictionary();
            mm = LoadSpecification(type, mm).Item2;
            return mm;
        }

        private void InstallSpecificationsBis(Type[] types, IMetamodelBuilder metamodel, IReflectorConfiguration config) {
            var sp = types.AsParallel().Select(type => GetSpecBis(type));
            sp.ForEach(i =>  i.ForEach(ii => metamodel.Add(ii.Key, ii.Value)));
        }


        private void InstallSpecifications(Type[] types, IMetamodelBuilder metamodel) {

            types.ForEach(type => LoadSpecification(type, metamodel));
        }

        private void PopulateAssociatedActions(Type[] services, IMetamodelBuilder metamodel) {
            IEnumerable<IObjectSpecBuilder> nonServiceSpecs = AllObjectSpecImmutables.OfType<IObjectSpecBuilder>();
            nonServiceSpecs.ForEach(s => PopulateAssociatedActions(s, services, metamodel));
        }

        private void PopulateAssociatedActions(IObjectSpecBuilder spec, Type[] services, IMetamodelBuilder metamodel) {
            if (string.IsNullOrWhiteSpace(spec.FullName)) {
                string id = (spec.Identifier != null ? spec.Identifier.ClassName : "unknown") ?? "unknown";
                Log.WarnFormat("Specification with id : {0} as has null or empty name", id);
            }

            if (TypeUtils.IsSystem(spec.FullName) && !spec.IsCollection) {
                return;
            }
            if (TypeUtils.IsNakedObjects(spec.FullName)) {
                return;
            }

            PopulateContributedActions(spec, services, metamodel);
            PopulateFinderActions(spec, services, metamodel);
        }

        private void InstallMainMenus(IMetamodelBuilder metamodel) {
            var menus = config.MainMenus?.Invoke(menuFactory);
            // Unlike other things specified in config, this one can't be checked when ReflectorConfiguration is constructed.
            // Allows developer to deliberately not specify any menus
            if (menus != null) {
                if (!menus.Any()) {
                    //Catches accidental non-specification of menus
                    throw new ReflectionException(Log.LogAndReturn("No MainMenus specified."));
                }
                foreach (IMenuImmutable menu in menus.OfType<IMenuImmutable>()) {
                    metamodel.AddMainMenu(menu);
                }
            }
        }

        private void InstallObjectMenus(IMetamodelBuilder metamodel) {
            IEnumerable<IMenuFacet> menuFacets = metamodel.AllSpecifications.Where(s => s.ContainsFacet<IMenuFacet>()).Select(s => s.GetFacet<IMenuFacet>());
            menuFacets.ForEach(mf => mf.CreateMenu(metamodel));
        }

        private void PopulateContributedActions(IObjectSpecBuilder spec, Type[] services, IMetamodelBuilder metamodel) {
            IList<IActionSpecImmutable> contributedActions = new List<IActionSpecImmutable>();
            IList<IActionSpecImmutable> collectionContribActions = new List<IActionSpecImmutable>();
            foreach (Type serviceType in services) {
                if (serviceType != spec.Type) {
                    var serviceSpecification = (IServiceSpecImmutable)metamodel.GetSpecification(serviceType);
                    IActionSpecImmutable[] serviceActions = serviceSpecification.ObjectActions.Where(sa => sa != null).ToArray();
                    List<IActionSpecImmutable> matchingActionsForObject = serviceActions.Where(sa => sa.IsContributedTo(spec)).ToList();
                    foreach (IActionSpecImmutable action in matchingActionsForObject) {
                        contributedActions.Add(action);
                    }

                    List<IActionSpecImmutable> matchingActionsForCollection = serviceActions.Where(sa => sa.IsContributedToCollectionOf(spec)).ToList();
                    foreach (IActionSpecImmutable action in matchingActionsForCollection) {
                        collectionContribActions.Add(action);
                    }
                }
            }
            spec.AddContributedActions(contributedActions);
            spec.AddCollectionContributedActions(collectionContribActions);
        }

        private void PopulateFinderActions(IObjectSpecBuilder spec, Type[] services, IMetamodelBuilder metamodel) {
            IList<IActionSpecImmutable> finderActions = new List<IActionSpecImmutable>();
            foreach (Type serviceType in services) {
                var serviceSpecification = (IServiceSpecImmutable)metamodel.GetSpecification(serviceType);
                List<IActionSpecImmutable> matchingActions =
                    serviceSpecification.ObjectActions.
                        Where(serviceAction => serviceAction.IsFinderMethodFor(spec)).ToList();

                if (matchingActions.Any()) {
                    matchingActions.Sort(new MemberOrderComparator<IActionSpecImmutable>());
                    foreach (IActionSpecImmutable action in matchingActions) {
                        finderActions.Add(action);
                    }
                }
            }
            spec.AddFinderActions(finderActions);
        }

        private Tuple<ITypeSpecBuilder, ImmutableDictionary<Type, ITypeSpecBuilder>> LoadSpecificationAndCache(Type type, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            Type actualType = classStrategy.GetType(type);

            if (actualType == null) {
                throw new ReflectionException(Log.LogAndReturn($"Attempting to introspect a non-introspectable type {type.FullName} "));
            }

            ITypeSpecBuilder specification = CreateSpecification(actualType, metamodel);

            if (specification == null) {
                throw new ReflectionException(Log.LogAndReturn($"unrecognised type {actualType.FullName}"));
            }

            // We need the specification available in cache even though not yet fully introspected 
            metamodel = metamodel.Add(actualType, specification);

            metamodel = specification.Introspect(facetDecoratorSet, new Introspector(this), metamodel);

            return new Tuple<ITypeSpecBuilder, ImmutableDictionary<Type, ITypeSpecBuilder>>(specification, metamodel);
        }

        private ITypeSpecBuilder LoadSpecificationAndCache(Type type, IMetamodelBuilder metamodel) {
            Type actualType = classStrategy.GetType(type);

            if (actualType == null) {
                throw new ReflectionException(Log.LogAndReturn($"Attempting to introspect a non-introspectable type {type.FullName} "));
            }

            ITypeSpecBuilder specification = CreateSpecification(actualType, metamodel);

            if (specification == null) {
                throw new ReflectionException(Log.LogAndReturn($"unrecognised type {actualType.FullName}"));
            }

            // We need the specification available in cache even though not yet fully introspected 
            metamodel.Add(actualType, specification);

            specification.Introspect(facetDecoratorSet, new Introspector(this), metamodel);

            return specification;
        }

        private ITypeSpecBuilder CreateSpecification(Type type, IMetamodelBuilder metamodel) {
            TypeUtils.GetType(type.FullName); // This should ensure type is cached 

            return IsService(type) ? (ITypeSpecBuilder)ImmutableSpecFactory.CreateServiceSpecImmutable(type, metamodel) : ImmutableSpecFactory.CreateObjectSpecImmutable(type, metamodel);
        }

        private ITypeSpecBuilder CreateSpecification(Type type, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            TypeUtils.GetType(type.FullName); // This should ensure type is cached 

            return IsService(type) ? (ITypeSpecBuilder)ImmutableSpecFactory.CreateServiceSpecImmutable(type, metamodel) : ImmutableSpecFactory.CreateObjectSpecImmutable(type, metamodel);
        }

        private bool IsService(Type type) {
            return serviceTypes.Contains(type);
        }
    }

    // Copyright (c) Naked Objects Group Ltd.
}