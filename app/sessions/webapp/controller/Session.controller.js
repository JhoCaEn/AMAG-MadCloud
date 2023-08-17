sap.ui.define([
    'sap/m/library',
    'sap/ui/core/mvc/ControllerExtension',
    'sap/ui/core/routing/HashChanger',
    'ch/amag/retail/dwb/sessions/actions/prepare'
], function (mobileLibrary, ControllerExtension, HashChanger, prepare) {
    'use strict';

    const URLHelper = mobileLibrary.URLHelper

    return ControllerExtension.extend('ch.amag.retail.dwb.sessions.controller.Session', {
        override: {
            routing: {
                onAfterBinding: async function (session) {
                    if (!session) return

                    const [isActiveEntity, isPrepared, callbackURL] = await session.requestProperty(['IsActiveEntity', 'isPrepared', 'callbackURL'])
                    
                    if (!isActiveEntity) 
                        return

                    const startupParameters = this.base.getAppComponent()?.getComponentData()?.startupParameters || {}
                    const callback = startupParameters.callback?.[0]
                    const done = startupParameters.done?.[0] === 'true'
    
                    delete startupParameters.callback
                    delete startupParameters.done

                    if (!isPrepared) 
                        return prepare.invoke(session, callback, this.base.getExtensionAPI())   

                    if (done && callbackURL)
                        return URLHelper.redirect(callbackURL)
                }
            }
        }
    })
});