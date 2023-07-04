sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension",
    "ch/amag/retail/dwb/carconfigurator/utils/internalNavigation"
], function (ControllerExtension, internalNavigation) {
    "use strict";

    return ControllerExtension.extend("ch.amag.retail.dwb.carconfigurator.controller.ext.CarConfiguration", {
        override: {
            routing: {
                onAfterBinding: async function (oContext) {
                    const router = this.base.routing
                    // internalNavigation.navTo(oContext, router)
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