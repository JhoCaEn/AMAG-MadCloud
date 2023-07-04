module.exports = (raw = [], brand_code) => {
    if (!raw.length) return []

    const groups = {}

    raw.forEach(entry => {
        const type = types[entry.Type]
        const colorType = colorTypes[entry.ColorType]

        if (!type || !colorType) return

        if (type.isCategory && !entry.Value) return
        if (type.isColor && !entry?._Color?.Color) return
        if (type.isEquipment && !entry?._Equipment?.Equipment) return

        const group = groups[`${colorType}_${entry.Bundle}`] ?? (groups[`${colorType}_${entry.Bundle}`] = {
            type_code: colorType,
            constraints: {},
            options: []
        })

        if (entry.Step === 1) {
            const constraint = group.constraints[entry.Choice] ?? (group.constraints[entry.Choice] = {
                constraints: []
            })

            constraint.constraints.push({
                equipment_id: entry?._Equipment?.Equipment || null
            })
        }

        if (entry.Step === 2) {
            const option = group.options[entry.Choice] ?? (group.options[entry.Choice] = {
                id: entry.Choice,
                rules: []
            })

            option.rules.push({
                id: entry.Place,
                category_brand_code: type.isCategory && entry.Value ? brand_code : null,
                category_id: type.isCategory ? entry.Value || null : null,
                color_id: type.isColor ? entry?._Color?.Color || null : null,
                equipment_id: type.isEquipment ? entry?._Equipment?.Equipment || null : null,
                isRequired: type.isRequired,
                isForbidden: type.isForbidden
            })
        }
    })

    const transformed = []

    Object.values(groups).forEach(group => {
        Object.values(group.constraints).forEach(constraint => {
            const options = Object.values(group.options).filter(({ rules }) => rules.length)

            if (!options.length) return

            transformed.push({
                type_code: group.type_code,
                constraint: constraint.constraints.map(({ equipment_id }) => equipment_id).join('_'),
                constraints: constraint.constraints,
                options: options.map(option => ({
                    ...option,
                    rules: option.rules.map(rule => ({
                        ...rule
                    }))
                }))
            })
        })
    })

    const uniques = {}
    return transformed.filter(({type_code, constraint}) => uniques[`${type_code}_${constraint}`] ? false : (uniques[`${type_code}_${constraint}`] = true))
}

const colorTypes = { FA: 'E', FI: 'I', FV: 'R' }

const types = {
    VK: { isCategory: true, isColor: false, isEquipment: false, isRequired: false, isForbidden: true },
    ZK: { isCategory: true, isColor: false, isEquipment: false, isRequired: true, isForbidden: false },
    VA: { isCategory: false, isColor: true, isEquipment: false, isRequired: false, isForbidden: true },
    VI: { isCategory: false, isColor: true, isEquipment: false, isRequired: false, isForbidden: true },
    VV: { isCategory: false, isColor: true, isEquipment: false, isRequired: false, isForbidden: true },
    ZA: { isCategory: false, isColor: true, isEquipment: false, isRequired: true, isForbidden: false },
    ZI: { isCategory: false, isColor: true, isEquipment: false, isRequired: true, isForbidden: false },
    ZV: { isCategory: false, isColor: true, isEquipment: false, isRequired: true, isForbidden: false },
    V: { isCategory: false, isColor: false, isEquipment: true, isRequired: false, isForbidden: true },
    Z: { isCategory: false, isColor: false, isEquipment: true, isRequired: true, isForbidden: false },
    EV: { isCategory: false, isColor: false, isEquipment: true, isRequired: false, isForbidden: true },
    EZ: { isCategory: false, isColor: false, isEquipment: true, isRequired: true, isForbidden: false }
}
