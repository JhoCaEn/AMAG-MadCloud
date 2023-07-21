sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'sap/m/MessageBox'
], function (ControllerExtension, MessageBox) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.callbacks.controller.Callback', {

        navigate: async function () {
            const oContext = this.base.getView().getBindingContext()
            const callback = await oContext.requestObject()
            const sSemantic = callback.semantic_code
            const parameters = callback.parameters
            const intentBasedNavigation = this.intentBasedNavigation || this.base.getExtensionAPI().intentBasedNavigation

            if (!parameters) {
                const i18n = this.base.getAppComponent().getModel('i18n')
                MessageBox.error(i18n.getProperty('Callbacks.Action.noParameters'))
                return
            }

            intentBasedNavigation.navigateOutbound(sSemantic, JSON.parse(parameters))
        },
    })

    
});