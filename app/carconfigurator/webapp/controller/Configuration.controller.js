sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/carconfigurator/actions/prepare'
], function (ControllerExtension, prepare) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.carconfigurator.controller.Configuration', {
        override: {
            routing: {
                onAfterBinding: async function (configuration) {
                    if(!configuration) return

                    const [isActiveEntity, isPrepared, callback_ID] = await configuration.requestProperty(['IsActiveEntity', 'isPrepared', 'callback_ID'])

                    if (!isActiveEntity && !isPrepared)
                        return prepare.invoke(configuration, this.base.getExtensionAPI())

                    if (isActiveEntity && callback_ID)
                        this.base.getExtensionAPI().intentBasedNavigation.navigateOutbound('Callback', { ID: callback_ID })
                }
            }
        }
    });
});