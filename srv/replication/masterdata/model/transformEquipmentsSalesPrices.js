module.exports = (raw = []) => {
    const transformed = []
    const uniques = {}

    const unique = (equipment, color, validFrom) => `${ equipment ?? '' }_${ color ?? '' }_${ validFrom }`

    raw.forEach(entry => {

        const price = {
            constraintEquipment_id: entry._Equipment?.Equipment || '',
            constraintColor_id: entry._Color?.Color || '',
            validFrom: entry.ValidFrom || '1970-01-01',
            validTo: entry.ValidTo || '9999-12-31',
            value: entry.Value,
            currency: entry.Currency,
            weighting: entry.Priority !== undefined ? 1000 - entry.Priority : 0
        }

        if (price.weighting > 0 && !price.constraintEquipment_id && !price.constraintColor_id)
            return

        if (uniques[unique(price.constraintEquipment_id, price.constraintColor_id, price.validFrom)])
            return

        uniques[unique(price.constraintEquipment_id, price.constraintColor_id, price.validFrom)] = true

        transformed.push(price)
    })

    return transformed
}
