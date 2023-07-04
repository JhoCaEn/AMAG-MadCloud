sap.ui.define(['sap/m/MessageToast'],
    function (MessageToast) {
        'use strict';

        return {
            invoke: async function (offer, extensionAPI) {
                const routing = this.routing || extensionAPI.routing
                const editFlow = this.editFlow || extensionAPI.editFlow
                const intentBasedNavigation = this.intentBasedNavigation || extensionAPI.intentBasedNavigation

                const brand_code = await offer.requestProperty('brand_code')
                const offerId = await offer.requestProperty('ID')

                if (!brand_code) {
                    routing.navigateToRoute('SelectableBrands', {
                        key: offer.getCanonicalPath().replace(/\/.*\((.*)\)/, '$1'),
                        query: {
                            layout: 'TwoColumnsBeginExpanded'
                        }
                    })
                    return
                }

                const promise = editFlow.invokeAction('AppOffersService.createCarConfiguration', {
                    contexts: offer
                })
                    .then(result => result.getProperty('value'))
                    .then(ID => intentBasedNavigation.navigateOutbound('CarConfigurator', { ID, offerId}))

                return editFlow.securedExecution(async function () {
                    MessageToast.show('Start car configurator')
                    return promise
                })
            },
        }
    }
);