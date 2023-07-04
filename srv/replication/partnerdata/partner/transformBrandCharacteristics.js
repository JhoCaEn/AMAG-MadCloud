module.exports = (raw = []) => {
    const transformed = {}

    raw.forEach(entry => {
        const brand = transformed[entry.Brand] ?? (transformed[entry.Brand] = {})

        brand[entry.Name] = brand[entry.Name] ? [ ...brand[entry.Name], entry.Value ] : entry.ValueAsDate || entry.Value
    })

    return transformed
}