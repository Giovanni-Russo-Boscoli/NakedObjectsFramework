// Copyright � Naked Objects Group Ltd ( http://www.nakedobjects.net). 
// All Rights Reserved. This code released under the terms of the 
// Microsoft Public License (MS-PL) ( http://opensource.org/licenses/ms-pl.html) 

using Common.Logging;
using NakedObjects.Architecture.Adapter;
using NakedObjects.Architecture.Facets.Objects.Aggregated;
using NakedObjects.Architecture.Persist;
using NakedObjects.Architecture.Reflect;
using NakedObjects.Architecture.Resolve;
using NakedObjects.Architecture.Security;
using NakedObjects.Architecture.Util;
using NakedObjects.Core.Util;

namespace NakedObjects.Persistor {
    public class DefaultPersistAlgorithm : IPersistAlgorithm {
        private readonly IObjectPersistor persistor;
        private readonly INakedObjectManager manager;
        private readonly IServicesManager services;
        private static readonly ILog Log;

        static DefaultPersistAlgorithm() {
            Log = LogManager.GetLogger(typeof (DefaultPersistAlgorithm));
        }

        public DefaultPersistAlgorithm(IObjectPersistor persistor, INakedObjectManager manager, IServicesManager services) {
            this.persistor = persistor;
            this.manager = manager;
            this.services = services;
        }


        #region IPersistAlgorithm Members

       
        public virtual void MakePersistent(INakedObject nakedObject,  ISession session) {
            if (nakedObject.Specification.IsCollection) {
                Log.Info("Persist " + nakedObject);

                nakedObject.GetAsEnumerable(manager).ForEach(no => Persist(no, session));

                if (nakedObject.ResolveState.IsGhost()) {
                    nakedObject.ResolveState.Handle(Events.StartResolvingEvent);
                    nakedObject.ResolveState.Handle(Events.EndResolvingEvent);
                }
            }
            else {
                if (nakedObject.ResolveState.IsPersistent()) {
                    throw new NotPersistableException("can't make object persistent as it is already persistent: " + nakedObject);
                }
                if (nakedObject.Specification.Persistable == Persistable.TRANSIENT) {
                    throw new NotPersistableException("can't make object persistent as it is not persistable: " + nakedObject);
                }
                Persist(nakedObject, session);
            }
        }

        public virtual string Name {
            get { return "Simple Bottom Up Persistence Walker"; }
        }

        

        #endregion

        protected void Persist(INakedObject nakedObject, ISession session) {
            if (nakedObject.ResolveState.IsAggregated() ||
                (nakedObject.ResolveState.IsTransient() &&
                 nakedObject.Specification.Persistable != Persistable.TRANSIENT)) {
                INakedObjectAssociation[] fields = nakedObject.Specification.Properties;
                if (!nakedObject.Specification.IsEncodeable && fields.Length > 0) {
                    Log.Info("make persistent " + nakedObject);
                    nakedObject.Persisting(session);
                    if (!nakedObject.Specification.ContainsFacet(typeof (IComplexTypeFacet))) {
                        manager.MadePersistent(nakedObject);
                    }

                    foreach (INakedObjectAssociation field in fields) {
                        if (!field.IsPersisted) {
                            continue;
                        }
                        if (field is IOneToManyAssociation) {
                            INakedObject collection = field.GetNakedObject(nakedObject, manager);
                            if (collection == null) {
                                throw new NotPersistableException("Collection " + field.GetName(services) + " does not exist in " + nakedObject.Specification.FullName);
                            }
                            MakePersistent(collection,  session);
                        }
                        else {
                            INakedObject fieldValue = field.GetNakedObject(nakedObject, manager);
                            if (fieldValue == null) {
                                continue;
                            }
                            Persist(fieldValue, session);
                        }
                    }
                    persistor.AddPersistedObject(nakedObject);
                }
            }
        }

        public override string ToString() {
            return new AsString(this).ToString();
        }
    }

    // Copyright (c) Naked Objects Group Ltd.
}