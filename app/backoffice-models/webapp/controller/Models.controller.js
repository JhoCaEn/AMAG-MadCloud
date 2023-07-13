sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension"
], function (ControllerExtension) {
    "use strict";

    return ControllerExtension.extend("ch.amag.retail.dwb.backoffice-models.controller.Models", {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: function (oSelectionVariant, oTargetInfo) {
                    if (oTargetInfo?.action === "manage" && oTargetInfo?.semanticObject === "DWBBOEngine") {
                        let aKeys = oSelectionVariant.getSelectOptionsPropertyNames()
                        const aTransmissionKeys = ['engine_id']

                        aKeys.filter(key => !aTransmissionKeys.includes(key)).map(key => oSelectionVariant.removeSelectOption(key))
                    }
                }
            }
        }
    })
});