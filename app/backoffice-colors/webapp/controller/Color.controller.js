sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/backoffice-colors/navigation/outbound'
], function (ControllerExtension, navigation) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.backoffice-colors.controller.Color', {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: navigation.adaptNavigationContext
            }
        }
    })
});