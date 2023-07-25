module.exports = (raw = [], type_code) => raw.map(entry => ({
    type_code,
    constraintEquipment_id: entry?._Equipment?.Equipment || '',
    constraintColor_id: entry?._Color?.Color || '',
    validFrom: entry.ValidFrom || '1970-01-01',
    validTo: entry.ValidTo || '9999-12-31',
    value: entry.Value,
    currency: entry.Currency,
    weighting: 1000 - entry.Priority
}))
