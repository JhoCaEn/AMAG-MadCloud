module.exports = (raw = [], brand_code) => {
    const restrictions = {}

    raw.forEach(entry => {
        const type = types[entry.Type]

        if (!type) return
        
        const restriction = restrictions[entry.Choice] ?? (restrictions[entry.Choice] = { id: entry.Choice, rules: [] })

        restriction.rules.push({
            id: entry.Place,
            category_brand_code: type.isCategory && entry.Value ? brand_code : null,
            category_id: type.isCategory ? entry.Value || null : null,
            color_id: type.isColor ? entry?._Color?.Color || null : null,
            equipment_id: type.isEquipment ? entry?._Equipment?.Equipment || null : null,
            isRequired: type.isRequired,
            isForbidden: type.isForbidden
        })
    })

    return Object.values(restrictions)
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
