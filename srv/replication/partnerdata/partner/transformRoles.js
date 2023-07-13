module.exports = (roles = [], brandValidFrom, brandValidTo) => {
    const transformed = []

    roles.forEach(({ id, validFrom = brandValidFrom, validTo = brandValidTo, isDefault }) => {

        if (validFrom > brandValidTo || validTo < brandValidFrom)
            return

        transformed.push({
            partner_id: id,
            validFrom,
            validTo,
            isDefault
        })
    })

    return transformed
}