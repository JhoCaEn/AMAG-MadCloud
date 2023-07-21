sap.ui.define([],
    function () {
        'use strict';

        return {
            invoke: async function (offer, extensionAPI) {
                const editFlow = this.editFlow || extensionAPI.editFlow

                const promise = editFlow.invokeAction('AppOffersService.finishCarConfiguration', {
                    contexts: offer
                })

                return editFlow.securedExecution(async function () {
                    return promise
                })
            },
        }
    }
);