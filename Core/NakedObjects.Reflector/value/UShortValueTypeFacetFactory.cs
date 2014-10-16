﻿// Copyright © Naked Objects Group Ltd ( http://www.nakedobjects.net). 
// All Rights Reserved. This code released under the terms of the 
// Microsoft Public License (MS-PL) ( http://opensource.org/licenses/ms-pl.html) 

using System;
using NakedObjects.Architecture.Adapter.Value;
using NakedObjects.Architecture.Facets;
using NakedObjects.Architecture.Reflect;

namespace NakedObjects.Reflector.DotNet.Value {
    public class UShortValueTypeFacetFactory : ValueUsingValueSemanticsProviderFacetFactory<ushort> {
        public UShortValueTypeFacetFactory(INakedObjectReflector reflector)
            :base(reflector, typeof (IUnsignedShortValueFacet)) {}

        public override bool Process(Type type, IMethodRemover methodRemover, ISpecification specification) {
            if (UShortValueSemanticsProvider.IsAdaptedType(type)) {
                var spec = Reflector.LoadSpecification(UShortValueSemanticsProvider.AdaptedType);
                AddFacets(new UShortValueSemanticsProvider(spec, specification));
                return true;
            }
            return false;
        }
    }
}