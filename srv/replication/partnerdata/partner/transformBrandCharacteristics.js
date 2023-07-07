module.exports = (raw = []) => {
    const transformed = {}

    raw.forEach(entry => {
        const brand = transformed[entry.Brand] ?? (transformed[entry.Brand] = {})

        if (brand[entry.Name]) {
            if (!Array.isArray(brand[entry.Name]))
                brand[entry.Name] = [brand[entry.Name]]
                
            brand[entry.Name].push(entry.Value)
        } else {
            brand[entry.Name] = entry.ValueAsDate || entry.Value
        }
    })

    return transformed
}