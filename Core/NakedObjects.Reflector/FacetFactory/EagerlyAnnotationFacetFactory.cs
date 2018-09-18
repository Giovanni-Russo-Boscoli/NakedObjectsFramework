﻿// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using System.Collections.Immutable;
using System.Reflection;
using NakedObjects.Architecture.Component;
using NakedObjects.Architecture.Facet;
using NakedObjects.Architecture.FacetFactory;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Architecture.Spec;
using NakedObjects.Architecture.SpecImmutable;
using NakedObjects.Meta.Facet;
using NakedObjects.Meta.Utils;

namespace NakedObjects.Reflect.FacetFactory {
    public sealed class EagerlyAnnotationFacetFactory : FacetFactoryAbstract {
        public EagerlyAnnotationFacetFactory(int numericOrder)
            : base(numericOrder, FeatureType.EverythingButActionParameters) {}

        public override void Process(IReflector reflector, Type type, IMethodRemover methodRemover, ISpecificationBuilder specification, IMetamodelBuilder metamodel) {
            var attribute = type.GetCustomAttribute<EagerlyAttribute>();
            FacetUtils.AddFacet(Create(attribute, specification));
        }

        public override void Process(IReflector reflector, PropertyInfo property, IMethodRemover methodRemover, ISpecificationBuilder specification, IMetamodelBuilder metamodel) {
            var attribute = property.GetCustomAttribute<EagerlyAttribute>();
            FacetUtils.AddFacet(Create(attribute, specification));
        }

        public override void Process(IReflector reflector, MethodInfo method, IMethodRemover methodRemover, ISpecificationBuilder specification, IMetamodelBuilder metamodel) {
            var attribute = method.GetCustomAttribute<EagerlyAttribute>();
            FacetUtils.AddFacet(Create(attribute, specification));
        }

        public override ImmutableDictionary<Type, ITypeSpecBuilder> Process(IReflector reflector, Type type, IMethodRemover methodRemover, ISpecificationBuilder specification, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            var attribute = type.GetCustomAttribute<EagerlyAttribute>();
            FacetUtils.AddFacet(Create(attribute, specification));
            return metamodel;
        }

        public override ImmutableDictionary<Type, ITypeSpecBuilder> Process(IReflector reflector, PropertyInfo property, IMethodRemover methodRemover, ISpecificationBuilder specification, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            var attribute = property.GetCustomAttribute<EagerlyAttribute>();
            FacetUtils.AddFacet(Create(attribute, specification));
            return metamodel;
        }

        public override ImmutableDictionary<Type, ITypeSpecBuilder> Process(IReflector reflector, MethodInfo method, IMethodRemover methodRemover, ISpecificationBuilder specification, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            var attribute = method.GetCustomAttribute<EagerlyAttribute>();
            FacetUtils.AddFacet(Create(attribute, specification));
            return metamodel;
        }

        private static IEagerlyFacet Create(EagerlyAttribute attribute, ISpecification holder) {
            return attribute == null ? null : new EagerlyFacet(EagerlyAttribute.Do.Rendering, holder);
        }
    }
}