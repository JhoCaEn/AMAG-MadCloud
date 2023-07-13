sap.ui.define([
    "sap/ui/core/mvc/ControllerExtension"
], function (ControllerExtension) {
    "use strict";

    return ControllerExtension.extend("ch.amag.retail.dwb.backoffice-models.controller.ModelColorRestrictionOptions", {
        override: {
            intentBasedNavigation: {
                adaptNavigationContext: function (oSelectionVariant, oTargetInfo) {
                    if (oTargetInfo?.action === "manage" && oTargetInfo?.semanticObject === "DWBBOColor") {
                        let aKeys = oSelectionVariant.getSelectOptionsPropertyNames()
                        const aColorKeys = ['color_id']

                        aKeys.filter(key => !aColorKeys.includes(key)).map(key => oSelectionVariant.removeSelectOption(key))
                    }
                }
            }
        }
    })
});