sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/sessions/navigation/outbound'
], function (ControllerExtension, navigation) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.sessions.controller.Session', {
        override: {
            routing: {
                onAfterBinding: async function (session) {
                    if (!session) return
                    
                    const isPrepared = await session.requestProperty('isPrepared')
                    const isActiveEntity = await session.requestProperty('IsActiveEntity')
                     
                    
                    if (isActiveEntity && !isPrepared) {
                        const editFlow = this.editFlow || this.base.getExtensionAPI().editFlow

                        const promise = editFlow.invokeAction('AppSessionsService.prepare', {
                            contexts: session
                        })
        
                        return editFlow.securedExecution(async function () {
                            return promise
                        })
                    }

                }
            },
            intentBasedNavigation: {
                adaptNavigationContext: navigation.adaptNavigationContext
            }
        }
    })
});