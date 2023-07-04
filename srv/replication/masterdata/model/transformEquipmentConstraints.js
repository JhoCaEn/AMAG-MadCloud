module.exports = (raw = [], brand_code) => {
    if (!raw.length) return []

    const groups = {}

    raw.forEach(entry => {
        const type = types[entry.Type]
        if (!type) return

        if (type.isCategory && !entry.Value) return
        if (type.isColor && !entry?._Color?.Color) return
        if (type.isEquipment && !entry?._Equipment?.Equipment) return

        const group = groups[entry.Bundle] ?? (groups[entry.Bundle] = {
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
    return transformed.filter(({constraint}) => uniques[constraint] ? false : (uniques[constraint] = true))
}

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
    Z: { isCategory: false, isColor: false, isEquipment: true, isRequired: true, isForbidden: false }
}
