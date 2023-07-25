module.exports = (raw = []) => raw.map(entry => ({
    constraintEquipment_id: entry?._Equipment?.Equipment || '',
    constraintColor_id: entry?._Color?.Color || '',
    validFrom: entry.ValidFrom || '1970-01-01',
    validTo: entry.ValidTo || '9999-12-31',
    value: entry.Value,
    currency: entry.Currency,
    weighting: 1000 - entry.Priority
}))
