sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/backoffice-partners/navigation/outbound'
], function (ControllerExtension, navigation) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.backoffice-partners.controller.Partner', {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: navigation.adaptNavigationContext
            }
        }
    })
});