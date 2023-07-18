sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'ch/amag/retail/dwb/backoffice-brands/navigation/outbound'
], function (ControllerExtension, navigation) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.backoffice-brands.controller.EquipmentCategory', {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: navigation.adaptNavigationContext
            }
        }
    })
});