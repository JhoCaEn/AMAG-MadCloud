sap.ui.define([],
    function () {
        'use strict';

        const outbounds = {
            DWBBOModel: {
                id: 'Equipments.models.id'
            }
        }

        const adaptNavigationContext = (selection, target) => {
            const outbound = outbounds[target?.semanticObject]

            if (!outbound)
                return

            const options = {}

            Object.entries(outbound).forEach(([targetName, sourceName]) => {
                options[targetName] = selection.getSelectOption(sourceName)?.[0]
            })

            selection.getSelectOptionsPropertyNames().forEach(name => selection.removeSelectOption(name))

            Object.entries(options).forEach(([name, option]) => {
                if (option)
                    selection.addSelectOption(name, option.Sign, option.Option, option.Low)
            })
        }

        return {
            adaptNavigationContext
        }
    }
)