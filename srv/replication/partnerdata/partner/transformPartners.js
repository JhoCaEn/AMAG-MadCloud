module.exports = (partners = [], validFrom, validTo) => {
    const transformed = []

    partners.forEach(partner => {
        if (!partner.validFrom) partner.validFrom = validFrom
        if (!partner.validTo) partner.validTo = validTo

        if (partner.validFrom <= validTo && partner.validTo <= validTo)
            transformed.push(partner)
    })

    return transformed
}