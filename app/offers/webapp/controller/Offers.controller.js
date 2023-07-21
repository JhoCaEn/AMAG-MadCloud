sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/offers/actions/checkStartupParams'
], function (ControllerExtension, checkStartupParams) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.offers.controller.Offers', {
        override: {
            routing: {
                onAfterBinding: async function () {
                    const oStartupParams = this.base.getAppComponent().getComponentData().startupParameters
                    if (!Object.keys(oStartupParams).length) return

                    const sOfferId = oStartupParams?.ID?.[0]

                    if (sOfferId) {
                        const oModel = this.base.getView().getModel()
                        const oExtensionAPI = this.base.getExtensionAPI()
                        this.base.getAppComponent().getComponentData().startupParameters = {}
                        return checkStartupParams.invoke(sOfferId, oExtensionAPI, oModel)
                    }
                }
            }
        }
    });
});