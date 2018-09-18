// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using System.Collections.Immutable;
using System.ComponentModel.DataAnnotations;
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
    public sealed class RequiredAnnotationFacetFactory : AnnotationBasedFacetFactoryAbstract {
        public RequiredAnnotationFacetFactory(int numericOrder)
            : base(numericOrder, FeatureType.PropertiesAndActionParameters) {}

        private static void Process(MemberInfo member, ISpecification holder) {
            var attribute = member.GetCustomAttribute<RequiredAttribute>();
            FacetUtils.AddFacet(Create(attribute, holder));
        }

        public override void Process(IReflector reflector, MethodInfo method, IMethodRemover methodRemover, ISpecificationBuilder specification, IMetamodelBuilder metamodel) {
            Process(method, specification);
        }

        public override void Process(IReflector reflector, PropertyInfo property, IMethodRemover methodRemover, ISpecificationBuilder specification, IMetamodelBuilder metamodel) {
            if (property.GetGetMethod() != null) {
                Process(property, specification);
            }
        }

        public override void ProcessParams(IReflector reflector, MethodInfo method, int paramNum, ISpecificationBuilder holder, IMetamodelBuilder metamodel) {
            ParameterInfo parameter = method.GetParameters()[paramNum];
            var attribute = parameter.GetCustomAttribute<RequiredAttribute>();
            FacetUtils.AddFacet(Create(attribute, holder));
        }

        public override ImmutableDictionary<Type, ITypeSpecBuilder> Process(IReflector reflector, MethodInfo method, IMethodRemover methodRemover, ISpecificationBuilder specification, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            Process(method, specification);
            return metamodel;
        }

        public override ImmutableDictionary<Type, ITypeSpecBuilder> Process(IReflector reflector, PropertyInfo property, IMethodRemover methodRemover, ISpecificationBuilder specification, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            if (property.GetGetMethod() != null) {
                Process(property, specification);
            }

            return metamodel;
        }

        public override ImmutableDictionary<Type, ITypeSpecBuilder> ProcessParams(IReflector reflector, MethodInfo method, int paramNum, ISpecificationBuilder holder, ImmutableDictionary<Type, ITypeSpecBuilder> metamodel) {
            ParameterInfo parameter = method.GetParameters()[paramNum];
            var attribute = parameter.GetCustomAttribute<RequiredAttribute>();
            FacetUtils.AddFacet(Create(attribute, holder));
            return metamodel;
        }

        private static IMandatoryFacet Create(RequiredAttribute attribute, ISpecification holder) {
            return attribute != null ? new MandatoryFacet(holder) : null;
        }
    }
}