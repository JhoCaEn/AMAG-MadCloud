sap.ui.define([],
    function () {
        'use strict';

        return {
            invoke: async function (configuration, extensionAPI) {  
                const editFlow = this.editFlow || extensionAPI.editFlow

                const promise = editFlow.invokeAction('AppCarConfiguratorService.prepare', {
                    contexts: configuration
                })

                return editFlow.securedExecution(async function () {
                    return promise
                })
            },
        }
    }
);