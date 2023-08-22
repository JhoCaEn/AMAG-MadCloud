sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'sap/m/MessageBox'
], function (ControllerExtension, MessageBox) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.callbacks.controller.Callback', {

        override: {
            routing: {
                onAfterBinding: async function (callback) {

                    const [semantic, parameters] = await callback.requestProperty(['semantic_code', 'parameters'])

                    if (semantic) {
                        //delete callback before navigation
                        await callback.delete()

                        this.base.getExtensionAPI().intentBasedNavigation.navigateOutbound(
                            semantic,
                            parameters ? JSON.parse(parameters) : undefined
                        )
                    }
                }
            }
        }
    })

    
});