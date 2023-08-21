sap.ui.define(['sap/m/MessageToast'],
    function (MessageToast) {
        'use strict';

        return {
            invoke: async function (offer, extensionAPI) {
                const routing = this.routing || extensionAPI.routing
                const editFlow = this.editFlow || extensionAPI.editFlow
                const intentBasedNavigation = this.intentBasedNavigation || extensionAPI.intentBasedNavigation

                const offerId = await offer.requestProperty('ID')

             
                const promise = editFlow.invokeAction('AppOffersService.order', {
                    contexts: offer
                })
                    .then(result => result.getProperty('value'))
                    .then(ID => intentBasedNavigation.navigateOutbound('Order', { ID, offerId}))

                return editFlow.securedExecution(async function () {
                    MessageToast.show('Start car configurator')
                    return promise
                })
            },
        }
    }
);