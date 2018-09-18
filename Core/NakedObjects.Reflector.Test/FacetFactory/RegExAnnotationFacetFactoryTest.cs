// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using System.ComponentModel.DataAnnotations;
using System.Reflection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NakedObjects.Architecture.Component;
using NakedObjects.Architecture.Facet;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Meta.Facet;
using NakedObjects.Reflect.FacetFactory;

namespace NakedObjects.Reflect.Test.FacetFactory {
    [TestClass]
    public class RegExAnnotationFacetFactoryTest : AbstractFacetFactoryTest {
        private RegExAnnotationFacetFactory facetFactory;

        protected override Type[] SupportedTypes {
            get { return new[] {typeof (IRegExFacet)}; }
        }

        protected override IFacetFactory FacetFactory {
            get { return facetFactory; }
        }

        #region Nested type: Customer

        [RegEx(Validation = "^A.*", Message = "Class message", CaseSensitive = false)]
        private class Customer {}

        #endregion

        #region Setup/Teardown

        [TestInitialize]
        public override void SetUp() {
            base.SetUp();
            facetFactory = new RegExAnnotationFacetFactory(0);
        }

        [TestCleanup]
        public override void TearDown() {
            facetFactory = null;
            base.TearDown();
        }

        #endregion

        private class Customer1 {
            [RegEx(Validation = "^A.*", Message = "Property message", CaseSensitive = false)]
// ReSharper disable UnusedMember.Local
            public string FirstName {
                get { return null; }
            }
        }

        private class Customer2 {
// ReSharper disable UnusedParameter.Local
            public void SomeAction([RegEx(Validation = "^A.*", Message = "Parameter message", CaseSensitive = false)] string foo) {}
        }

        private class Customer3 {
            [RegEx(Validation = "^A.*", CaseSensitive = false)]
            public int NumberOfOrders {
                get { return 0; }
            }
        }

        private class Customer4 {
            public void SomeAction([RegEx(Validation = "^A.*", CaseSensitive = false)] int foo) {}
        }

        private class Customer5 {
            [RegEx(Validation = "^A.*", CaseSensitive = false)]
            public string FirstName {
                get { return null; }
            }
        }

        private class Customer7 {
            [RegularExpression("^A.*", ErrorMessage = "Property message")]
            public string FirstName {
                get { return null; }
            }
        }

        private class Customer8 {
            public void SomeAction([RegularExpression("^A.*", ErrorMessage = "Parameter message")] string foo) {}
        }

        private class Customer9 {
            [RegularExpression("^A.*")]
            public int NumberOfOrders {
                get { return 0; }
            }
        }

        private class Customer10 {
            public void SomeAction([RegularExpression("^A.*")] int foo) {}
        }

        private class Customer11 {
            [RegularExpression("^A.*")]
            public string FirstName {
                get { return null; }
            }
        }

        [TestMethod]
        public override void TestFeatureTypes() {
            FeatureType featureTypes = facetFactory.FeatureTypes;
            Assert.IsTrue(featureTypes.HasFlag(FeatureType.Objects));
            Assert.IsTrue(featureTypes.HasFlag(FeatureType.Properties));
            Assert.IsFalse(featureTypes.HasFlag(FeatureType.Collections));
            Assert.IsFalse(featureTypes.HasFlag(FeatureType.Actions));
            Assert.IsTrue(featureTypes.HasFlag(FeatureType.ActionParameters));
        }

        [TestMethod]
        public void TestRegExAnnotationIgnoredForNonStringsProperty() {
            PropertyInfo property = FindProperty(typeof (Customer3), "NumberOfOrders");
            facetFactory.Process(Reflector, property, MethodRemover, Specification, Metamodel);
            Assert.IsNull(Specification.GetFacet(typeof (IRegExFacet)));
        }

        [TestMethod]
        public void TestRegExAnnotationIgnoredForPrimitiveOnActionParameter() {
            MethodInfo method = FindMethod(typeof (Customer4), "SomeAction", new[] {typeof (int)});
            facetFactory.ProcessParams(Reflector, method, 0, Specification, Metamodel);
            Assert.IsNull(Specification.GetFacet(typeof (IRegExFacet)));
        }

        [TestMethod]
        public void TestRegExAnnotationMessageNullWhenNotSpecified() {
            PropertyInfo property = FindProperty(typeof (Customer5), "FirstName");
            facetFactory.Process(Reflector, property, MethodRemover, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual(null, regExFacet.FailureMessage);
        }

        [TestMethod]
        public void TestRegExAnnotationPickedUpOnActionParameter() {
            MethodInfo method = FindMethod(typeof (Customer2), "SomeAction", new[] {typeof (string)});
            facetFactory.ProcessParams(Reflector, method, 0, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            Assert.IsNotNull(facet);
            Assert.IsTrue(facet is RegExFacet);
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual("^A.*", regExFacet.ValidationPattern);
            Assert.AreEqual("Parameter message", regExFacet.FailureMessage);
            Assert.AreEqual(false, regExFacet.IsCaseSensitive);
        }

        [TestMethod]
        public void TestRegExAnnotationPickedUpOnClass() {
            facetFactory.Process(Reflector, typeof (Customer), MethodRemover, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            Assert.IsNotNull(facet);
            Assert.IsTrue(facet is RegExFacet);
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual("^A.*", regExFacet.ValidationPattern);
            Assert.AreEqual("Class message", regExFacet.FailureMessage);
            Assert.AreEqual(false, regExFacet.IsCaseSensitive);
        }

        [TestMethod]
        public void TestRegExAnnotationPickedUpOnProperty() {
            PropertyInfo property = FindProperty(typeof (Customer1), "FirstName");
            facetFactory.Process(Reflector, property, MethodRemover, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            Assert.IsNotNull(facet);
            Assert.IsTrue(facet is RegExFacet);
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual("^A.*", regExFacet.ValidationPattern);
            Assert.AreEqual("Property message", regExFacet.FailureMessage);
            Assert.AreEqual(false, regExFacet.IsCaseSensitive);
        }

        [TestMethod]
        public void TestRegularExpressionAnnotationIgnoredForNonStringsProperty() {
            PropertyInfo property = FindProperty(typeof (Customer9), "NumberOfOrders");
            facetFactory.Process(Reflector, property, MethodRemover, Specification, Metamodel);
            Assert.IsNull(Specification.GetFacet(typeof (IRegExFacet)));
        }

        [TestMethod]
        public void TestRegularExpressionAnnotationIgnoredForPrimitiveOnActionParameter() {
            MethodInfo method = FindMethod(typeof (Customer10), "SomeAction", new[] {typeof (int)});
            facetFactory.ProcessParams(Reflector, method, 0, Specification, Metamodel);
            Assert.IsNull(Specification.GetFacet(typeof (IRegExFacet)));
        }

        [TestMethod]
        public void TestRegularExpressionAnnotationMessageNullWhenNotSpecified() {
            PropertyInfo property = FindProperty(typeof (Customer11), "FirstName");
            facetFactory.Process(Reflector, property, MethodRemover, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual(null, regExFacet.FailureMessage);
        }

        [TestMethod]
        public void TestRegularExpressionAnnotationPickedUpOnActionParameter() {
            MethodInfo method = FindMethod(typeof (Customer8), "SomeAction", new[] {typeof (string)});
            facetFactory.ProcessParams(Reflector, method, 0, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            Assert.IsNotNull(facet);
            Assert.IsTrue(facet is RegExFacet);
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual("^A.*", regExFacet.ValidationPattern);
            Assert.AreEqual("Parameter message", regExFacet.FailureMessage);
            Assert.AreEqual(true, regExFacet.IsCaseSensitive);
        }

        [TestMethod]
        public void TestRegularExpressionAnnotationPickedUpOnProperty() {
            PropertyInfo property = FindProperty(typeof (Customer7), "FirstName");
            facetFactory.Process(Reflector, property, MethodRemover, Specification, Metamodel);
            IFacet facet = Specification.GetFacet(typeof (IRegExFacet));
            Assert.IsNotNull(facet);
            Assert.IsTrue(facet is RegExFacet);
            var regExFacet = (RegExFacet) facet;
            Assert.AreEqual("^A.*", regExFacet.ValidationPattern);
            Assert.AreEqual("Property message", regExFacet.FailureMessage);
            Assert.AreEqual(true, regExFacet.IsCaseSensitive);
        }
    }

    // Copyright (c) Naked Objects Group Ltd.
    // ReSharper restore UnusedMember.Local
    // ReSharper restore UnusedParameter.Local
}