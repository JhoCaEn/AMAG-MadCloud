sap.ui.define([
    'sap/ui/core/mvc/ControllerExtension',
    'sap/ui/model/Filter'
], function (ControllerExtension, Filter) {
    'use strict';

    return ControllerExtension.extend('ch.amag.retail.dwb.offers.controller.Offers', {
        override: {
            routing: {
                onAfterBinding: async function () {
                    const oStartupParams = this.base.getAppComponent().getComponentData().startupParameters

                    if (!Object.keys(oStartupParams).length) return

                    const sOfferId = oStartupParams?.ID?.[0]

                    if (sOfferId)
                        await this.navigateToDetail(sOfferId)

                    this.base.getAppComponent().getComponentData().startupParameters = {}
                }
            }
        },

        navigateToDetail: async function (sID) {
            const oObject = await this.getOfferInfo(sID)
            const iOcd = oObject.ocd
            const bIsActiveEntity = oObject.IsActiveEntity

            let key = `ocd=${iOcd},ID=${sID}`

            if (!bIsActiveEntity)
                if (!iOcd) key = `ID=${sID},IsActiveEntity=${bIsActiveEntity}`
                else key = `ocd=${iOcd},ID=${sID},IsActiveEntity=${bIsActiveEntity}`


            this.base.routing.navigateToRoute('Offer', {
                key: key
            })
        },

        getOfferInfo: async function (sID) {
            const oModel = this.base.getView().getModel()

            const oNotDraftFilter = this.buildFilter(sID, true)

            let oOffersList = oModel.bindList('/Offers', undefined, undefined, oNotDraftFilter, {
                $select: 'ocd,IsActiveEntity'
            })

            let aContexts = await oOffersList.requestContexts()

            if (!aContexts.length) {
                const oDraftFilter = this.buildFilter(sID, false)

                oOffersList = oModel.bindList('/Offers', undefined, undefined, oDraftFilter, {
                    $select: 'ocd,IsActiveEntity'
                })

                aContexts = await oOffersList.requestContexts()
            }

            if (!aContexts.length) return null

            return aContexts[0].getObject()
        },

        buildFilter: function (sId, bActive) {
            return new Filter({
                filters: [
                    new Filter('ID', 'EQ', sId),
                    new Filter('IsActiveEntity', 'EQ', bActive)
                ],
                and: true
            })
        }
    });
});