﻿// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using NakedObjects.Architecture.Persist;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Architecture.Security;
using NakedObjects.Core.Context;
using NakedObjects.Core.Reflect;
using NakedObjects.Objects;

namespace NakedObjects {
    /// <summary>
    /// Defines a service that provides easy access to the principal components of the framework.
    /// An implementation of this service interface will be injected into any domain
    /// object that needs it.
    /// </summary>
    public interface INakedObjectsFramework {
        IMessageBroker MessageBroker { get; }

        IUpdateNotifier UpdateNotifier { get; }

        ISession Session { get; }

        ILifecycleManager LifecycleManager { get; }

        INakedObjectManager Manager { get; }

        IServicesManager Services { get; }

        IObjectPersistor Persistor { get; }

        INakedObjectReflector Reflector { get; }

        IAuthorizationManager AuthorizationManager { get; }

        IContainerInjector Injector { get; }
    }
}