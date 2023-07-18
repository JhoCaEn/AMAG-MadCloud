sap.ui.define([],
    function () {
        'use strict';

        const outbounds = {
            DWBBOPartner: {
                id: ['Partners.brands.soldToPartners.partner_id',
                    'Partners.brands.shipToPartners.partner_id',
                    'Partners.brands.billToPartners.partner_id',
                    'Partners.brands.paidByPartners.partner_id'
                ]
            }
        }

        const adaptNavigationContext = (selection, target) => {
            const outbound = outbounds[target?.semanticObject]

            if (!outbound)
                return

            const options = {}

            Object.entries(outbound).forEach(([targetName, sourceNames]) => {
                let option
                for (const sourceName of sourceNames) {
                    option = selection.getSelectOption(sourceName)?.[0]

                    if (option) break
                }

                if (option)
                    options[targetName] = option
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