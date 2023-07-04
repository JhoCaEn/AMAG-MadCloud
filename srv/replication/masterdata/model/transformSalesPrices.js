module.exports = (raw = []) => raw.map(entry => ({
    validTo: entry.ValidTo || '9999-12-31',
    validFrom: entry.ValidFrom || '1970-01-01',
    value: entry.Value,
    currency: entry.Currency || 'CHF'
}))
