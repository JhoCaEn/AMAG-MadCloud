sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension",
    "ch/amag/retail/dwb/carconfigurator/utils/internalNavigation",
    "ch/amag/retail/dwb/carconfigurator/actions/prepareHandler"
], function (ControllerExtension, internalNavigation, prepareHandler) {
    "use strict";

    return ControllerExtension.extend("ch.amag.retail.dwb.carconfigurator.controller.ext.CarConfiguration", {
        override: {
            routing: {
                onAfterBinding: async function (configuration) {
                    if(!configuration) return
                    
                    const isActiveEntity = await configuration.requestProperty('IsActiveEntity')
                    const isPrepared = await configuration.requestProperty('isPrepared')
                    // const intentBasedNavigation = this.base.intentBasedNavigation
                    // const ID = await configuration.requestProperty('callback_ID')

                    // if (isActiveEntity && ID) 
                    //     intentBasedNavigation.navigateOutbound('Callback', { ID })

                    if (!isPrepared && !isActiveEntity)
                        return prepareHandler.invoke(configuration, this.base.getExtensionAPI())
                }
            },

            editFlow : {
                onBeforeSave: async function (mParameters) {
                    // const intentBasedNavigation = this.base.intentBasedNavigation
                                    
                    // if(this.base?.getAppComponent()?.getComponentData()?.startupParameters?.offerId) {
                    //     const sOfferId = this.base?.getAppComponent()?.getComponentData()?.startupParameters?.offerId[0]
                    //     intentBasedNavigation.navigateOutbound('Offers', {
                    //         ID: sOfferId,
                    //         IsActiveEntity: false,
                    //         callBackConfiguration: true
                    //     })
                    // }
                },
            }
        }
    });
});