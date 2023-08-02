module.exports = (salesPrices = [], equipments = [], colors = [], responseKey) => {
    const response = {}

    salesPrices = salesPrices.sort((a, b) => {
        if (a.weighting < b.weighting) return 1
        if (a.weighting > b.weighting) return -1

        return 0
    })

    for (let salesPrice of salesPrices) {
        const key = salesPrice[responseKey]

        if (response[key]) continue

        const constraintEquipment = salesPrice.constraintEquipment_id
        const constraintColor = salesPrice.constraintColor_id

        const equipmentExists = equipments.includes(constraintEquipment)
        const colorExists = colors.includes(constraintColor)

        if (constraintEquipment && equipmentExists) response[key] = salesPrice
        else if (constraintColor && colorExists) response[key] = salesPrice
        else if (!constraintEquipment && !constraintColor) response[key] = salesPrice
    }

    return Object.values(response)
}