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

                    const isActiveEntity = await configuration.requestProperty('IsActiveEntity')

                    const isPrepared = await configuration.requestProperty('isPrepared')

                    if (!isActiveEntity && !isPrepared)
                        return prepare.invoke(configuration, this.base.getExtensionAPI())

                    const callback_ID = await configuration.requestProperty('callback_ID')
                    if (isActiveEntity && callback_ID)
                        this.base.getExtensionAPI().intentBasedNavigation.navigateOutbound('Callback', { ID: callback_ID })
                }
            }
        }
    });
});