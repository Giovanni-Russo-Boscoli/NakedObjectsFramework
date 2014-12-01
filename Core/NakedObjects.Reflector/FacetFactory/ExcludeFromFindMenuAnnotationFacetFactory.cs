// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System.Reflection;
using NakedObjects.Architecture.Component;
using NakedObjects.Architecture.Facet;
using NakedObjects.Architecture.FacetFactory;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Architecture.Spec;
using NakedObjects.Meta.Facet;
using NakedObjects.Meta.Utils;

namespace NakedObjects.Reflect.FacetFactory {
    /// <summary>
    ///     Creates an <see cref="IExcludeFromFindMenuFacet" /> based on the presence of an
    ///     <see cref="ExcludeFromFindMenuAttribute" /> annotation
    /// </summary>
    public class ExcludeFromFindMenuAnnotationFacetFactory : AnnotationBasedFacetFactoryAbstract {
        public ExcludeFromFindMenuAnnotationFacetFactory(int numericOrder)
            : base(numericOrder, FeatureType.Action) {}

        private static void Process(MemberInfo member, ISpecification holder) {
            var attribute = member.GetCustomAttribute<ExcludeFromFindMenuAttribute>();
            FacetUtils.AddFacet(Create(attribute, holder));
        }

        public override void Process(IReflector reflector, MethodInfo method, IMethodRemover methodRemover, ISpecificationBuilder specification) {
            Process(method, specification);
        }

        private static IExcludeFromFindMenuFacet Create(ExcludeFromFindMenuAttribute attribute, ISpecification holder) {
            return attribute == null ? null : new ExcludeFromFindMenuFacet(holder);
        }
    }
}