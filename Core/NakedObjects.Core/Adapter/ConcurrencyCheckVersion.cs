﻿// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using NakedObjects.Architecture.Adapter;
using NakedObjects.Architecture.Component;
using NakedObjects.Core.Util;

namespace NakedObjects.Core.Adapter {
    public sealed class ConcurrencyCheckVersion : IVersion, IEncodedToStrings {
        private readonly DateTime time;
        private readonly string user;
        private readonly object version;

        private const string Wildcard = "*";

        public ConcurrencyCheckVersion(string user, DateTime time, object version) {
            this.user = user;
            this.time = time;
            this.version = version;
        }

        public ConcurrencyCheckVersion(IMetamodelManager metamodel, string[] strings) {
            Assert.AssertNotNull(metamodel);
            var helper = new StringDecoderHelper(metamodel, strings);

            user = helper.GetNextString();
            time = new DateTime(helper.GetNextLong());
            version = helper.GetNextObject();
        }

        #region IEncodedToStrings Members

        public string[] ToEncodedStrings() {
            var helper = new StringEncoderHelper();

            helper.Add(user);
            helper.Add(time.Ticks);
            helper.Add(version);

            return helper.ToArray();
        }

        public string[] ToShortEncodedStrings() {
            return ToEncodedStrings();
        }

        #endregion

        #region IVersion Members

        public string User => user;

        public DateTime? Time => time;

        public string Digest => version != null ? IdentifierUtils.ComputeMD5HashAsString(version.ToString()) : null;

        public bool IsDifferent(IVersion otherVersion) {
            return !Equals(otherVersion);
        }

        public bool IsDifferent(string digest) {
            return digest != Wildcard && Digest != digest;
        }

        public string AsSequence() {
            return version.ToString();
        }

        public bool Equals(IVersion other) {
            var entityVersion = other as ConcurrencyCheckVersion;
            return entityVersion != null && version.Equals(entityVersion.version);
        }

        #endregion

        public override bool Equals(object obj) {
            var entityVersion = obj as ConcurrencyCheckVersion;
            return Equals(entityVersion);
        }

        public override int GetHashCode() {
            return version.GetHashCode();
        }

        public override string ToString() {
            return $"Version: {version} (last read at : {Time} by : {User})";
        }
    }
}