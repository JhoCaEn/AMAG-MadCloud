module.exports = (raw = {}, roles = []) => {
    const transformed = []

    Object.entries(raw).forEach(([key, value]) => {

        const transform = (key, value, validFrom, validTo, roles) => {
            const transformed = {
                brand_code: key,
                validFrom: validFrom,
                validTo: validTo,
                contracts: transformContracts(key, value.VERTRAGSART)
            }
        
            transformed.hasContracts = !!transformed?.contracts?.length
            transformed.isRepresentative = !!value.VAS_EINTRITT
        
            if (!transformed.validTo)
                transformed.validTo = transformed.validFrom
                    ? '9999-12-31'
                    : '1970-01-01'
        
            if (transformed.validTo == '1970-01-01') return null
        
            if (!transformed.validFrom)
                transformed.validFrom = '1970-01-01'
        
            transformed.soldToPartners = transformPartner(roles?.[key]?.AG, transformed.validFrom, transformed.validTo)
            transformed.shipToPartners = transformPartner(roles?.[key]?.WE, transformed.validFrom, transformed.validTo)
            transformed.billToPartners = transformPartner(roles?.[key]?.RE, transformed.validFrom, transformed.validTo)
            transformed.paidByPartners = transformPartner(roles?.[key]?.RG, transformed.validFrom, transformed.validTo)
        
            return transformed
        }

        const validFromH = transform(key, value, value.H_EINTRITT, value.H_AUSTRITT, roles)
        const validFromVas = transform(key, value, value.VAS_EINTRITT, value.VAS_AUSTRITT, roles)

        if (validFromH)
            transformed.push(validFromH)

        if (validFromVas)
            transformed.push(validFromVas)
    })

    return transformed
}

const transformContracts = require('./transformContracts')
const transformPartner =require('./transformPartners')