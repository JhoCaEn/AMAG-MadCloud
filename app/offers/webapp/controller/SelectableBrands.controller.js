sap.ui.define([
    'sap/fe/core/PageController',
    'ch/amag/retail/dwb/offers/actions/selectBrand'
],
    function (PageController, selectBrand) {
        'use strict';

        return PageController.extend('ch.amag.retail.dwb.offers.controller.SelectableBrands', {

            getImageURL: function (code) {
                return sap.ui.require.toUrl(`ch/amag/retail/dwb/offers/images/${code}.svg`)
            },

            onTilePress: async function (event) {
                const brand = event.getSource().getBindingContext()
                const code = await brand.requestProperty('code')

                const offer = this.getView().getBindingContext()

                return selectBrand.invoke(offer, code, this)
            },
        })
    }
)