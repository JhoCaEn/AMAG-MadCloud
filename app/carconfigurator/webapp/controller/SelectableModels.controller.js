sap.ui.define([
    "sap/fe/core/PageController",
    "ch/amag/retail/dwb/carconfigurator/utils/internalNavigation"
],
    function (PageController, internalNavigation) {
        "use strict";

        return PageController.extend("ch.amag.retail.dwb.carconfigurator.controller.SelectableModels", {
            async onModelActionPress() {
                const oTable = this.byId('ModelsMacroTable')
                const model = oTable.getSelectedContexts()[0]
                const configuration = this.oView.getBindingContext()
                const sModelId = await model.requestProperty('model_id')

                const router = this.routing
                const editFlow = this.editFlow

                const promise = editFlow.invokeAction('AppCarConfiguratorService.selectModel', {
                    contexts: configuration,
                    parameterValues: [{
                        name: 'model_id',
                        value: sModelId
                    }],
                    skipParameterDialog: true
                })
                    .then(() => internalNavigation.navTo(configuration, router))

                return editFlow.securedExecution(async function () {
                    return promise
                })
            },

            onModelPress(oEvent) {
                const routing = this.getExtensionAPI().routing

                const oContext = oEvent.getParameter("bindingContext")
                const sModelId = oContext.getProperty('model_id')

                //todo -> navigate...
            }
        })
    }
)
