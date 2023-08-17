sap.ui.define([],
    function () {
        'use strict';

        return {
            invoke: async function (session, callbackURL, extensionAPI) {
                const editFlow = this.editFlow || extensionAPI.editFlow
                const intentBasedNavigation = this.intentBasedNavigation || extensionAPI.intentBasedNavigation

                const promise = editFlow.invokeAction('AppSessionsService.prepare', {
                    contexts: session,
                    parameterValues: [{
                        name: 'callbackURL',
                        value: callbackURL
                    }],
                    skipParameterDialog: true
                }).then(async () => {
                    const [forwardToOffer, offer_ID] = await session.requestProperty(['forwardToOffer', 'offer_ID'])

                    if (forwardToOffer)
                        return intentBasedNavigation.navigateOutbound(
                            'offer-manage',
                            offer_ID ? { ID: offer_ID } : undefined
                        )
                })

                return editFlow.securedExecution(async function () {
                    return promise
                })
            },
        }
    }
);