module.exports = (raw = []) => {
    const transformed = {}

    raw.forEach(entry => {
        const brand = transformed[entry.Brand] ?? (transformed[entry.Brand] = {})

        if (!entry._RolePartner.Partner) return

        const partner = {
            partner_id: entry._RolePartner.Partner,
            validFrom: entry?.ValidFrom,
            validTo: entry?.ValidTo,
            isDefault: entry?.IsDefault
        }

        if (brand[entry.Role])
            brand[entry.Role].push(partner)
        else
            brand[entry.Role] = [partner]
    })

    return transformed
}