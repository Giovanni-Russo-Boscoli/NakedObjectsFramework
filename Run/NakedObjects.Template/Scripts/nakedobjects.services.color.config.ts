/// <reference path="typings/lodash/lodash.d.ts" />
/// <reference path="nakedobjects.models.ts" />
/// <reference path="nakedobjects.app.ts" />

module NakedObjects {

    app.run((color: IColor) => {
        //Note: colour is determined by the FIRST matching rule

        //Match specific class
        color.addType("ExampleModel.Customer", 1);
       
        //Default colour -  must be specified last
        color.setDefault(0);
    });
}