// Copyright � Naked Objects Group Ltd ( http://www.nakedobjects.net). 
// All Rights Reserved. This code released under the terms of the 
// Microsoft Public License (MS-PL) ( http://opensource.org/licenses/ms-pl.html) 

using System;
using NakedObjects.Architecture.Adapter.Value;
using NakedObjects.Architecture.Facets;
using NakedObjects.Architecture.Reflect;

namespace NakedObjects.Reflector.DotNet.Value {
    public class FloatValueTypeFacetFactory : ValueUsingValueSemanticsProviderFacetFactory<float> {
        public FloatValueTypeFacetFactory(INakedObjectReflector reflector)
            :base(reflector, typeof (IFloatingPointValueFacet)) {}

        public override bool Process(Type type, IMethodRemover methodRemover, ISpecification specification) {
            if (FloatValueSemanticsProvider.IsAdaptedType(type)) {
                var spec = Reflector.LoadSpecification(FloatValueSemanticsProvider.AdaptedType);
                AddFacets(new FloatValueSemanticsProvider(spec, specification));
                return true;
            }
            return false;
        }
    }
}