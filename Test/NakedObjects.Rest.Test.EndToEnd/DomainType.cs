﻿// Copyright © Naked Objects Group Ltd ( http://www.nakedobjects.net). 
// All Rights Reserved. This code released under the terms of the 
// Microsoft Public License (MS-PL) ( http://opensource.org/licenses/ms-pl.html) 

using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace RestfulObjects.Test.EndToEnd {
    [TestClass]
    public class DomainTypeTests {
        private const string dt = Urls.DomainTypes + Urls.NameSpace + "MostSimple";
   
        [TestMethod]
        public void DomainType() {
            Helpers.TestResponse(dt, null, null, Methods.Put, Codes.MethodNotValid);

        }

        [TestMethod]
        public void AttemptPut() {
            Helpers.TestResponse(dt, null, null, Methods.Put, Codes.MethodNotValid);
        }

        [TestMethod]
        public void AttemptPost() {
            Helpers.TestResponse(dt, null, null, Methods.Put, Codes.MethodNotValid);
        }

        [TestMethod]
        public void AttemptDelete() {
            Helpers.TestResponse(dt, null, null, Methods.Put, Codes.MethodNotValid);
        }
    }
}