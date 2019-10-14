// Copyright Naked Objects Group Ltd, 45 Station Road, Henley on Thames, UK, RG9 1AT
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. 
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0.
// Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Runtime.Serialization;
using NakedObjects.Facade;
using NakedObjects.Facade.Contexts;
using NakedObjects.Rest.Snapshot.Constants;
using NakedObjects.Rest.Snapshot.Utility;

namespace NakedObjects.Rest.Snapshot.Representations {
    [DataContract]
    public class ParameterRepresentation : Representation {
        protected ParameterRepresentation(IOidStrategy oidStrategy, HttpRequestMessage req, IObjectFacade objectFacade, FieldFacadeAdapter parameter, RestControlFlags flags)
            : base(oidStrategy, flags) {
            SetName(parameter);
            SetExtensions(req, objectFacade, parameter, flags);
            SetLinks(req, objectFacade, parameter);
            SetHeader(objectFacade);
        }

        internal string Name { get; set; }

        [DataMember(Name = JsonPropertyNames.Links)]
        public LinkRepresentation[] Links { get; set; }

        [DataMember(Name = JsonPropertyNames.Extensions)]
        public MapRepresentation Extensions { get; set; }

        private void SetHeader(IObjectFacade objectFacade) {
            SetEtag(objectFacade);
        }

        private void SetName(FieldFacadeAdapter parameter) {
            Name = parameter.Id;
        }

        private LinkRepresentation CreatePromptLink(HttpRequestMessage req, IObjectFacade objectFacade, FieldFacadeAdapter parameter) {
            var opts = new List<OptionalProperty>();

         
            if (parameter.IsAutoCompleteEnabled) {
                var arguments = new OptionalProperty(JsonPropertyNames.Arguments, MapRepresentation.Create(new OptionalProperty(JsonPropertyNames.XRoSearchTerm, MapRepresentation.Create(new OptionalProperty(JsonPropertyNames.Value, null, typeof (object))))));
                var extensions = new OptionalProperty(JsonPropertyNames.Extensions, MapRepresentation.Create(new OptionalProperty(JsonPropertyNames.MinLength, parameter.AutoCompleteMinLength)));

                opts.Add(arguments);
                opts.Add(extensions);
            }
            else {
                Tuple<string, ITypeFacade>[] parms = parameter.GetChoicesParameters();
                OptionalProperty[] args = parms.Select(tuple => RestUtils.CreateArgumentProperty(OidStrategy, req, tuple, Flags)).ToArray();
                var arguments = new OptionalProperty(JsonPropertyNames.Arguments, MapRepresentation.Create(args));
                opts.Add(arguments);
            }

            return LinkRepresentation.Create(OidStrategy, new PromptRelType(parameter.GetHelper(OidStrategy, req, objectFacade)), Flags, opts.ToArray());
        }

        private void SetLinks(HttpRequestMessage req, IObjectFacade objectFacade, FieldFacadeAdapter parameter) {
            var tempLinks = new List<LinkRepresentation>();

            if (parameter.IsAutoCompleteEnabled || parameter.GetChoicesParameters().Any()) {
                tempLinks.Add(CreatePromptLink(req, objectFacade, parameter));
            }

            Links = tempLinks.ToArray();
        }

        private void SetExtensions(HttpRequestMessage req, IObjectFacade objectFacade, FieldFacadeAdapter parameter, RestControlFlags flags) {
            IDictionary<string, object> custom = null;

            if (IsUnconditionalChoices(parameter)) {
                custom = new Dictionary<string, object>();

                Tuple<IObjectFacade, string>[] choices = parameter.GetChoicesAndTitles(objectFacade, null);
                Tuple<object, string>[] choicesArray = choices.Select(tuple => new Tuple<object, string>(parameter.GetChoiceValue(OidStrategy, req, tuple.Item1, flags), tuple.Item2)).ToArray();

                OptionalProperty[] op = choicesArray.Select(tuple => new OptionalProperty(tuple.Item2, tuple.Item1)).ToArray();
                MapRepresentation map = MapRepresentation.Create(op);
                custom[JsonPropertyNames.CustomChoices] = map;
            }

            string mask = parameter.Mask;

            if (!string.IsNullOrWhiteSpace(mask)) {
                custom = custom ?? new Dictionary<string, object>();
                custom[JsonPropertyNames.CustomMask] = mask;
            }

            var multipleLines = parameter.NumberOfLines;

            if (multipleLines > 1) {
                custom = custom ?? new Dictionary<string, object>();
                custom[JsonPropertyNames.CustomMultipleLines] = multipleLines;
            }

            custom = RestUtils.AddRangeExtension(parameter.AsField, custom);

            Extensions = RestUtils.GetExtensions(friendlyname: parameter.Name,
                                                  description: parameter.Description,
                                                  pluralName: null,
                                                  domainType: null,
                                                  isService: null,
                                                  hasParams: null,
                                                  optional: !parameter.IsMandatory,
                                                  maxLength: parameter.MaxLength,
                                                  pattern: parameter.Pattern,
                                                  memberOrder: null,
                                                  dataType: parameter.DataType,
                                                  presentationHint: parameter.PresentationHint,
                                                  customExtensions: custom,
                                                  returnType: parameter.Specification,
                                                  elementType: parameter.ElementType,
                                                  oidStrategy: OidStrategy,
                                                  useDateOverDateTime: true);
        }

        private static bool IsUnconditionalChoices(FieldFacadeAdapter parameter) {
            return parameter.IsChoicesEnabled != Choices.NotEnabled &&
                   (parameter.Specification.IsParseable || (parameter.Specification.IsCollection && parameter.ElementType.IsParseable)) &&
                   !parameter.GetChoicesParameters().Any();
        }


        private static LinkRepresentation CreateDefaultLink(IOidStrategy oidStrategy, HttpRequestMessage req, FieldFacadeAdapter parameter, IActionFacade action,  IObjectFacade defaultNakedObject, string title, RestControlFlags flags) {
            var helper = new UriMtHelper(oidStrategy, req, defaultNakedObject);
            var relType = new DefaultRelType(action.Id, parameter.Id, helper);

            return LinkRepresentation.Create(oidStrategy, relType, flags, new OptionalProperty(JsonPropertyNames.Title, title));
        }


        private static object CreateDefaultLinks(IOidStrategy oidStrategy, HttpRequestMessage req, FieldFacadeAdapter parameter, IActionFacade action, IObjectFacade defaultNakedObject, string title, RestControlFlags flags) {
            if (defaultNakedObject.Specification.IsCollection) {
                return defaultNakedObject.ToEnumerable().Select(i => CreateDefaultLink(oidStrategy, req, parameter, action, i, i.TitleString, flags)).ToArray();
            }
            return CreateDefaultLink(oidStrategy, req, parameter, action, defaultNakedObject, title, flags);
        }


        public static ParameterRepresentation Create(IOidStrategy oidStrategy, HttpRequestMessage req, IObjectFacade objectFacade, IActionParameterFacade parameter, RestControlFlags flags) {
            var optionals = new List<OptionalProperty>();

            if (parameter.IsChoicesEnabled != Choices.NotEnabled && !parameter.GetChoicesParameters().Any()) {
                IObjectFacade[] choices = parameter.GetChoices(objectFacade, null);
                object[] choicesArray = choices.Select(c => RestUtils.GetChoiceValue(oidStrategy, req, c, parameter, flags)).ToArray();
                optionals.Add(new OptionalProperty(JsonPropertyNames.Choices, choicesArray));
            }

            var adapter = new FieldFacadeAdapter(parameter);

            // include default value for for nonnullable boolean so we can distinguish from nullable on client 
            if (parameter.DefaultTypeIsExplicit(objectFacade) || (parameter.Specification.IsBoolean && !parameter.IsNullable)) {
                IObjectFacade defaultNakedObject = parameter.GetDefault(objectFacade);
                if (defaultNakedObject != null) {
                    string title = defaultNakedObject.TitleString;
                    object value = RestUtils.ObjectToPredefinedType(defaultNakedObject.Object, true);
                    var isValue = defaultNakedObject.Specification.IsParseable || (defaultNakedObject.Specification.IsCollection && defaultNakedObject.ElementSpecification.IsParseable);
                    object defaultValue = isValue ? value : CreateDefaultLinks(oidStrategy, req, adapter, parameter.Action, defaultNakedObject, title, flags);

                    optionals.Add(new OptionalProperty(JsonPropertyNames.Default, defaultValue));
                }
            }

            
            if (optionals.Count == 0) {
                return new ParameterRepresentation(oidStrategy, req, objectFacade, adapter, flags);
            }
            return CreateWithOptionals<ParameterRepresentation>(new object[] {oidStrategy, req, objectFacade, adapter, flags}, optionals);
        }

        public static ParameterRepresentation Create(IOidStrategy oidStrategy, HttpRequestMessage req, IObjectFacade objectFacade, IAssociationFacade assoc, ActionContextFacade actionContext, RestControlFlags flags) {
            var optionals = new List<OptionalProperty>();

            if (assoc.IsChoicesEnabled != Choices.NotEnabled && !assoc.GetChoicesParameters().Any()) {
                IObjectFacade[] choices = assoc.GetChoices(objectFacade, null);
                object[] choicesArray = choices.Select(c => RestUtils.GetChoiceValue(oidStrategy, req, c, assoc, flags)).ToArray();
                optionals.Add(new OptionalProperty(JsonPropertyNames.Choices, choicesArray));
            }

            var adapter = new FieldFacadeAdapter(assoc);

            IObjectFacade defaultNakedObject = assoc.GetValue(objectFacade);
            if (defaultNakedObject != null) {
                string title = defaultNakedObject.TitleString;
                object value = RestUtils.ObjectToPredefinedType(defaultNakedObject.Object, true);
                var isValue = defaultNakedObject.Specification.IsParseable || (defaultNakedObject.Specification.IsCollection && defaultNakedObject.ElementSpecification.IsParseable);
                object defaultValue = isValue ? value : CreateDefaultLinks(oidStrategy, req, adapter, actionContext.Action, defaultNakedObject, title, flags);

                optionals.Add(new OptionalProperty(JsonPropertyNames.Default, defaultValue));
            }
        
            if (optionals.Count == 0) {
                return new ParameterRepresentation(oidStrategy, req, objectFacade, adapter, flags);
            }
            return CreateWithOptionals<ParameterRepresentation>(new object[] { oidStrategy, req, objectFacade, adapter, flags }, optionals);
        }
    }
}