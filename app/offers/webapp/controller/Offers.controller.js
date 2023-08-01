sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'sap/ui/model/Filter',
    'ch/amag/retail/dwb/offers/actions/finishCarConfiguration'
], function (ControllerExtension, Filter, finishCarConfiguration) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.offers.controller.Offers', {
        override: {
            routing: {
                onAfterBinding: async function () {
                    const startupParameters = this.base.getAppComponent()?.getComponentData()?.startupParameters || {}

                    const ID = startupParameters.ID?.[0]
                    const carConfigurationDone = startupParameters.carConfigurationDone?.[0] === 'true'

                    delete startupParameters.ID
                    delete startupParameters.carConfigurationDone

                    if (!ID) return

                    const offer = await this._getOffer(ID, 'IsActiveEntity')
                    if (offer) {
                        const { IsActiveEntity: isActiveEntity } = offer.getObject()

                        let location = window.location.href

                        if (!isActiveEntity && carConfigurationDone) {
                            await finishCarConfiguration.invoke(offer, this.base.getExtensionAPI())

                            location = location.replace('carConfigurationDone=true', '')
                        }

                        location = location.replace(`ID=${ID}`, '')
                        location = location.replace(/\?[&]*/, '?')
                        location = location.replace('/?', `${offer.getCanonicalPath()}?`)

                        window.location = location
                    }
                }
            }
        },

        _getOffer: async function (ID, $select = 'ocd,IsActiveEntity') {
            const model = this.base.getView().getModel() 
            const offers = await model.bindList('/Offers', undefined, undefined, new Filter({
                filters: [
                    new Filter('ID', 'EQ', ID),
                    new Filter({
                        filters: [
                            new Filter('IsActiveEntity', 'EQ', false),
                            new Filter('SiblingEntity/IsActiveEntity', 'EQ', null),
                        ]
                    })
                ],
                and: true
            }), { $select }).requestContexts()

            return offers[0]
        }
    });
});