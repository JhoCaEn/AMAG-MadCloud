sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension'
], function (ControllerExtension) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.callbacks.controller.Callback', {
        navigate: async function () {
            const oCrossAppNav = sap.ushell.Container.getService("CrossApplicationNavigation")
            const oContext = this.base.getView().getBindingContext()
            const callback = await oContext.requestObject()
            const sSemantic = callback.semantic_code
            const sSemanticObject = sSemantic.split('-')[0]
            const sAction = sSemantic.split('-')[1]
            const parameters = callback.parameters

            if (!parameters)
                oCrossAppNav.toExternal({
                    target: { semanticObject: sSemanticObject, action: sAction }
                });
            else
                oCrossAppNav.toExternal({
                    target: { semanticObject: sSemanticObject, action: sAction },
                    params: JSON.parse(parameters)
                });
        },
    })
});