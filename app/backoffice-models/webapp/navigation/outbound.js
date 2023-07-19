sap.ui.define([],
    function () {
        'use strict';

        const outbounds = {
            DWBBOEngine: {
                id: [
                    'Models.engine.id'
                ]
            },
            DWBBOTransmission: {
                id: [
                    'Models.transmission.id'
                ]
            },
            DWBBOEquipment: {
                id: [
                    'Models.equipments.id',
                    'Models.standardEquipments.id',
                    'Models.extraEquipments.id',
                    'Models.restrictions.rules.equipment.id',
                    'Models.colorCombinations.restrictions.options.rules.equipment.id',
                    'Models.extraEquipments.restrictions.options.rules.equipment.id',
                    'equipment_id'
                ]
            },
            DWBBOColor: {
                id: [
                    'Models.restrictions.rules.color.id',
                    'Models.colorCombinations.restrictions.options.rules.color.id',
                    'Models.extraEquipments.restrictions.options.rules.color.id',
                    'Models.exteriorColors.id',
                    'Models.interiorColors.id',
                    'Models.roofColors.id'
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