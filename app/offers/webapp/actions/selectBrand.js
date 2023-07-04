sap.ui.define([
    'ch/amag/retail/dwb/offers/actions/createCarConfiguration'
],
    function (createCarConfiguration) {
        'use strict';

        return {
            invoke: async function (offer, code, extensionAPI) {
                const routing = this.routing || extensionAPI.routing
                const editFlow = this.editFlow || extensionAPI.editFlow

                const promise = editFlow.invokeAction('AppOffersService.selectBrand', {
                    contexts: offer,
                    parameterValues: [{
                        name: 'code',
                        value: code
                    }],
                    skipParameterDialog: true
                })

                await editFlow.securedExecution(async function () {
                    return promise
                })

                routing.navigateToRoute('Offer', {
                    key: offer.getCanonicalPath().replace(/\/.*\((.*)\)/,'$1'),
                    query: {
                        layout: 'OneColumn'
                    }
                })
                
                return createCarConfiguration.invoke(offer, extensionAPI)
            },
        }
    }
);