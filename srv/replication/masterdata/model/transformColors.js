module.exports = (combinations = []) => {
    const colors = {}

    const min = (i, j) => i < j ? i : j
    const max = (i, j) => i > j ? j : i

    const add = (color_id, combination) => {
        if (!color_id) return

        const { validFrom, validTo, orderableFrom, orderableTo } = combination

        const color = colors[color_id] ?? (colors[color_id] = { color_id, validFrom, validTo, orderableFrom, orderableTo })

        color.validFrom = min(color.validFrom, validFrom)
        color.validTo = max(color.validTo, validTo)
        color.orderableFrom = min(color.orderableFrom, orderableFrom)
        color.orderableTo = max(color.validTo, orderableTo)
    }

    combinations.forEach(combination => {
        add(combination.interior_id, combination)
        add(combination.exterior_id, combination)
        add(combination.roof_id, combination)
    })

    return Object.values(colors)
}
