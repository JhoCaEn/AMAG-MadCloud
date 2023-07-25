module.exports = (raw = []) => raw.map(entry => ({
    constraintEquipment_id: '',
    constraintColor_id: '',
    validFrom: entry.ValidFrom || '1970-01-01',
    validTo: entry.ValidTo || '9999-12-31',
    value: entry.Value,
    currency: entry.Currency,
    weighting: 0
}))
