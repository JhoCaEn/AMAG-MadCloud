sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/offers/actions/selectSalesPartner',
    'ch/amag/retail/dwb/offers/actions/finishCarConfiguration'
], function (ControllerExtension, selectSalesPartner, finishCarConfiguration) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.offers.controller.Offer', {
        override: {
            routing: {
                onAfterBinding: async function (offer) {
                    if (!offer) return

                    const extensionAPI = this.base.getExtensionAPI()
                    const startupParameters = this.base.getAppComponent()?.getComponentData()?.startupParameters || {}

                    const [hasSalesPartner, isActiveEntity, callback_ID] = await offer.requestProperty(['hasSalesPartner', 'IsActiveEntity', 'callback_ID'])

                    if (!hasSalesPartner) {
                        return selectSalesPartner.invoke(offer, extensionAPI)
                    }

                    if (isActiveEntity && callback_ID) {
                        extensionAPI.intentBasedNavigation.navigateOutbound('Callback', { ID: callback_ID })
                    }

                    if (!isActiveEntity && startupParameters.carConfigurationDone?.[0] === 'true') {
                        await finishCarConfiguration.invoke(offer, extensionAPI)

                        window.location.hash = window.location.hash.replace('carConfigurationDone=true', '')
                    }
                }
            }
        }
    });
});