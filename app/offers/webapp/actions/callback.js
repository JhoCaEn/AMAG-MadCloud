sap.ui.define(['sap/m/MessageToast'],
    function (MessageToast) {
        'use strict';

        return {
            invoke: async function (offer, extensionAPI) {
                const intentBasedNavigation = this.intentBasedNavigation || extensionAPI.intentBasedNavigation
                const ID = await offer.requestProperty('callback_ID')

                intentBasedNavigation.navigateOutbound('Callback', { ID })
            }
        }
    }
);