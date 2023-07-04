sap.ui.define([
    'sap/fe/core/PageController',
    'sap/ui/model/Filter',
    'sap/ui/model/FilterOperator'
],
    function (PageController, Filter, FilterOperator) {
        'use strict';

        return PageController.extend('ch.amag.retail.dwb.carconfigurator.controller.SelectableColors', {

            onSearchColor: function (oEvent) {
                const oList = this.getView().byId('colorList')
                const sQuery = oEvent.getParameters().query
                let oFilter = null

                if (sQuery) oFilter = new Filter({ path: 'colorName', caseSensitive: false, operator: FilterOperator.Contains, value1: sQuery })

                oList.getBinding("items").filter(oFilter || [])
            },

            onColorSelection: async function (oEvent) {
                const oView = this.getView()
                const oTable = oEvent.getSource()
                const bSelected = oEvent.getParameters().selected
                const oColor = oEvent.getParameters().listItem.getBindingContext()
                const oConfiguration = oView.getBindingContext()
                const sColorId = await oColor.requestProperty('color_id')
                const editFlow = this.editFlow

                if (bSelected) {
                    const promise = editFlow.invokeAction('AppCarConfiguratorService.selectColor', {
                        contexts: oConfiguration,
                        parameterValues: [{
                            name: 'color_id',
                            value: sColorId
                        }],
                        skipParameterDialog: true
                    })

                    return editFlow.securedExecution(async function () {
                        return promise
                    })
                }
            }
        })
    }
)