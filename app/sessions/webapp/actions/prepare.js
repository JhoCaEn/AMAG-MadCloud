sap.ui.define([],
    function () {
        'use strict';

        return {
            invoke: async function (session, extensionAPI) {
                const editFlow = this.editFlow || extensionAPI.editFlow
                const intentBasedNavigation = this.intentBasedNavigation || extensionAPI.intentBasedNavigation

                const promise = editFlow.invokeAction('AppSessionsService.prepare', {
                    contexts: session
                }).then(async () => {

                    const forwardToOffer = await session.requestProperty('forwardToOffer')
                    const callbackURL = await session.requestProperty('callbackURL')

                    if (forwardToOffer) {
                        const offer_ID = await session.requestProperty('offer_ID')

                        return intentBasedNavigation.navigateOutbound(
                            'offer-manage',
                            offer_ID ? { ID: offer_ID } : undefined
                        )                
                    } else if ( callbackURL ) {
                        sap.m.URLHelper.redirect("https://www.google.com/");
                    }                       
                })

                return editFlow.securedExecution(async function () {
                    return promise
                })
            },
        }
    }
);