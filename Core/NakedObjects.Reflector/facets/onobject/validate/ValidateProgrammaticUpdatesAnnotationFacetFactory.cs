// Copyright � Naked Objects Group Ltd ( http://www.nakedobjects.net). 
// All Rights Reserved. This code released under the terms of the 
// Microsoft Public License (MS-PL) ( http://opensource.org/licenses/ms-pl.html) 

using System;
using NakedObjects.Architecture.Facets;
using NakedObjects.Architecture.Facets.Objects.Validation;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Reflector.DotNet.Facets.Objects.Validation;
using NakedObjects.Util;

namespace NakedObjects.Reflector.DotNet.Facets.Objects.Immutable {
    public class ValidateProgrammaticUpdatesAnnotationFacetFactory : AnnotationBasedFacetFactoryAbstract {
        public ValidateProgrammaticUpdatesAnnotationFacetFactory(INakedObjectReflector reflector)
            :base(reflector, NakedObjectFeatureType.ObjectsOnly) { }

        public override bool Process(Type type, IMethodRemover methodRemover, ISpecification specification) {
            var attribute = type.GetCustomAttributeByReflection<ValidateProgrammaticUpdatesAttribute>();
            return FacetUtils.AddFacet(Create(attribute, specification));
        }

        private static IValidateProgrammaticUpdatesFacet Create(ValidateProgrammaticUpdatesAttribute attribute, ISpecification holder) {
            return attribute == null ? null : new ValidateProgrammaticUpdatesFacetAnnotation(holder);
        }
    }
}