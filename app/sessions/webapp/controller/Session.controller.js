sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/sessions/actions/prepare'
], function (ControllerExtension, prepare) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.sessions.controller.Session', {
        override: {
            routing: {
                onAfterBinding: async function (session) {
                    if (!session) return
                    
                    const isActiveEntity = await session.requestProperty('IsActiveEntity')
                    if (!isActiveEntity) return

                    const isPrepared = await session.requestProperty('isPrepared')
                    
                    if (!isPrepared) 
                        return prepare.invoke(session, this.base.getExtensionAPI())   
                }
            }
        }
    })
});