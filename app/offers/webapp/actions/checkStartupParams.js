sap.ui.define([],
    function () {
        'use strict';

        return {
            invoke: async function (ID, extensionAPI, oModel) {
                const routing = this.routing || extensionAPI.routing
                const editFlow = this.editFlow || extensionAPI.editFlow

                const promise = editFlow.invokeAction('AppOffersService/checkStartupParams', {
                    model: oModel,
                    parameterValues: [{
                        name: 'ID',
                        value: ID
                    }],
                    skipParameterDialog: true
                })
                    .then(result => {
                        const ocd = result.ocd
                        const isActiveEntity = result.IsActiveEntity
                        let key = `ocd=${ocd},ID=${ID}`

                        if (!isActiveEntity)
                            if (!ocd) key = `ID=${ID},IsActiveEntity=${isActiveEntity}`
                            else key = `ocd=${ocd},ID=${ID},IsActiveEntity=${isActiveEntity}`
                        

                        routing.navigateToRoute('Offer', {
                            key: key
                        })
                    })

                return editFlow.securedExecution(async function () {
                    return promise
                })
            },
        }
    }
);