sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/backoffice-transmissions/navigation/outbound'
], function (ControllerExtension, navigation) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.backoffice-transmissions.controller.Transmission', {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: navigation.adaptNavigationContext
            }
        }
    })
});