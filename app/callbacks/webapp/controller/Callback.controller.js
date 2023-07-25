sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'sap/m/MessageBox'
], function (ControllerExtension, MessageBox) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.callbacks.controller.Callback', {

        override: {
            routing: {
                onAfterBinding: async function (callback) {

                    const isActiveEntity = await callback.requestObject('IsActiveEntity')
                    if (!isActiveEntity) return

                    const semantic = await callback.requestObject('semantic_code')

                    if (semantic) {
                        const parameters = await callback.requestObject('parameters')

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