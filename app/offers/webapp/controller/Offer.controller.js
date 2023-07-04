sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/offers/actions/selectSalesPartner'
], function (ControllerExtension, selectSalesPartner) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.offers.controller.Offer', {
        override: {
            routing: {
                onAfterBinding: async function (offer) {
                    if (!offer) return
                    
                    const hasSalesPartner = await offer.requestProperty('hasSalesPartner')
                    
                    if (!hasSalesPartner) {
                        return selectSalesPartner.invoke(offer, this.base.getExtensionAPI())
                    }
                }
            },

            editFlow: {
                onBeforeSave: async function(mParameters) {
                    // normal controller way : this.getOwnerComponent().oAppComponent.getComponentData().startupParameters
                    
                    if(this.base?.getAppComponent()?.getComponentData()?.startupParameters?.callBackConfiguration)
                        mParameters.context.setProperty('carConfigurationIsValid', true)
                }
            }
        }
    });
});