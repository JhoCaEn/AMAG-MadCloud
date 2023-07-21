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

                    const intentBasedNavigation = this.base.intentBasedNavigation
                    
                    const hasSalesPartner = await offer.requestProperty('hasSalesPartner')
                    const ID = await offer.requestProperty('callback_ID')
                    const isActiveEntity = await offer.requestProperty('IsActiveEntity')

                    const carConfigurationDone = this.base?.getAppComponent()?.getComponentData()?.startupParameters?.carConfigurationDone
                     
                    
                    if (!hasSalesPartner) {
                        return selectSalesPartner.invoke(offer, this.base.getExtensionAPI())
                    }

                    if (isActiveEntity && ID) 
                        intentBasedNavigation.navigateOutbound('Callback', { ID })

                    if (!isActiveEntity && carConfigurationDone) {
                        delete this.base?.getAppComponent()?.getComponentData()?.startupParameters?.carConfigurationDone
                        return finishCarConfiguration.invoke(offer, this.base.getExtensionAPI())
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