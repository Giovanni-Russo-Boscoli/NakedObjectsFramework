﻿// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System.Collections.Generic;
using NakedObjects.Facade;
using NakedObjects.Facade.Contexts;

namespace NakedObjects.Rest.Snapshot.Utility {
    public class BadPersistArgumentsException : BadArgumentsNOSException {
        public BadPersistArgumentsException(string message, IList<ContextFacade> contexts, RestControlFlags flags) : base(message, contexts) {
            Flags = flags;
        }

        public BadPersistArgumentsException(string message, ObjectContextFacade context, RestControlFlags flags) : base(message, context) {
            Flags = flags;
        }

        public BadPersistArgumentsException(string message, ObjectContextFacade context, IList<ContextFacade> contexts, RestControlFlags flags) : base(message, context, contexts) {
            Flags = flags;
        }

        public RestControlFlags Flags { get; private set; }
    }
}