module.exports = (raw = []) => {
    const transformed = {}

    raw.forEach(entry => {
        if (!entry._RolePartner.Partner) return

        const brand = transformed[entry.Brand] ?? (transformed[entry.Brand] = {})
        const role = brand[entry.Role] ?? (brand[entry.Role] = [])

        role.push({
            id: entry._RolePartner.Partner,
            validFrom: entry.ValidFrom,
            validTo: entry.ValidTo,
            isDefault: entry.IsDefault || false
        })
    })

    return transformed
}