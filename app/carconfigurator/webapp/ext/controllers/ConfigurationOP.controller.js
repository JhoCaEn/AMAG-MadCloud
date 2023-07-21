sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension",
    "ch/amag/retail/dwb/carconfigurator/utils/internalNavigation"
], function (ControllerExtension, internalNavigation) {
    "use strict";

    return ControllerExtension.extend("ch.amag.retail.dwb.carconfigurator.controller.ext.CarConfiguration", {
        override: {
            routing: {
                onAfterBinding: async function (configuration) {
                    if(!configuration) return

                    const intentBasedNavigation = this.base.intentBasedNavigation
                    const ID = await configuration.requestProperty('callback_ID')
                    const isActiveEntity = await configuration.requestProperty('IsActiveEntity')

                    if (isActiveEntity && ID) 
                        intentBasedNavigation.navigateOutbound('Callback', { ID })
                }
            },

            editFlow : {
                onBeforeSave: async function (mParameters) {
                    const intentBasedNavigation = this.base.intentBasedNavigation
                                    
                    if(this.base?.getAppComponent()?.getComponentData()?.startupParameters?.offerId) {
                        const sOfferId = this.base?.getAppComponent()?.getComponentData()?.startupParameters?.offerId[0]
                        intentBasedNavigation.navigateOutbound('Offers', {
                            ID: sOfferId,
                            IsActiveEntity: false,
                            callBackConfiguration: true
                        })
                    }
                },
            }
        }
    });
});