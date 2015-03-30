// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using NakedObjects;

namespace AdventureWorksModel {
    public class ShoppingCartItem : AWDomainObject {
        [Hidden]
        public virtual int ShoppingCartItemID { get; set; }

        [Hidden]
        public virtual string ShoppingCartID { get; set; }

        [MemberOrder(20)]
        public virtual int Quantity { get; set; }

        [Hidden]
        public virtual DateTime DateCreated { get; set; }

        #region Product
        [NakedObjectsIgnore]
        public virtual int ProductID { get; set; }

        [Disabled, MemberOrder(10)]
        public virtual Product Product { get; set; }
        #endregion

        #region ModifiedDate

        [Disabled, MemberOrder(99)]
        public override DateTime ModifiedDate { get; set; }

        #endregion

        public string Title() {
            var t = Container.NewTitleBuilder();
            t.Append(Quantity).Append(" x", Product);
            return t.ToString();
        }
    }
}