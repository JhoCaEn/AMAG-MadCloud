sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension'
], function (ControllerExtension, navigation) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.backoffice-brands.controller.Brand', {
        override: {
            onInit: function () {
                const oRouter = this.base.getAppComponent().getRouter()
                oRouter.getRoute('Brand').attachPatternMatched(this.onBrandsMatched, this)
            }
        },

        onBrandsMatched: function (oEvent) {
            const oStartupParams = this.base.getAppComponent().getComponentData().startupParameters

            if (!Object.keys(oStartupParams).length) return

            const sBrandCode = oStartupParams?.code?.[0]
            const sSalesTypeBrandCode = oStartupParams?.salesType_brand_code?.[0]
            const sSalesTypeId = oStartupParams?.salesType_id?.[0]

            if (sBrandCode && sSalesTypeBrandCode && sSalesTypeId)
                this.base.routing.navigateToRoute('SalesType', {
                    key: `code='${sBrandCode}'`,
                    key2: `brand_code='${sSalesTypeBrandCode}',id='${sSalesTypeId}'`
                })
        }
    })
});