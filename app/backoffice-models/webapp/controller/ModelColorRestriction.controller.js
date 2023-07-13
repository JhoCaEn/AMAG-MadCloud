sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension"
], function (ControllerExtension) {
    "use strict";

    return ControllerExtension.extend("ch.amag.retail.dwb.backoffice-models.controller.ModelColorRestriction", {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: function (oSelectionVariant, oTargetInfo) {
                    if (oTargetInfo?.action === "manage" && oTargetInfo?.semanticObject === "DWBBOEquipment") {
                        let aKeys = oSelectionVariant.getSelectOptionsPropertyNames()
                        const aEquipmentKeys = ['equipment_id']

                        aKeys.filter(key => !aEquipmentKeys.includes(key)).map(key => oSelectionVariant.removeSelectOption(key))
                    }
                }
            }
        }
    })
});