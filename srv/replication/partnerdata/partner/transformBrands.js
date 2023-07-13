module.exports = (raw = {}, brandRoles = []) => {
    const transformed = []

    Object.entries(raw).forEach(([brand_code, raw]) => {

        const transform = (validFrom, validTo) => {
            const transformed = {
                brand_code,
                validFrom,
                validTo: validTo || '9999-12-31',
                hasContracts: false,
                contracts: transformContracts(brand_code, raw.VERTRAGSART)
            }
        
            transformed.hasContracts = !!transformed.contracts?.length
        
            transformed.soldToPartners = transformRoles(brandRoles[brand_code]?.AG, transformed.validFrom, transformed.validTo)
            transformed.shipToPartners = transformRoles(brandRoles[brand_code]?.WE, transformed.validFrom, transformed.validTo)
            transformed.billToPartners = transformRoles(brandRoles[brand_code]?.RE, transformed.validFrom, transformed.validTo)
            transformed.paidByPartners = transformRoles(brandRoles[brand_code]?.RG, transformed.validFrom, transformed.validTo)
        
            return transformed
        }

        if (raw.H_EINTRITT) {
            const dealer = transform(raw.H_EINTRITT, raw.H_AUSTRITT)
            transformed.push(dealer)
        }

        if (raw.VAS_EINTRITT) {
            const representative = transform(raw.VAS_EINTRITT, raw.VAS_AUSTRITT)
            representative.isRepresentative = true
            transformed.push(representative)
        }
    })

    return transformed
}

const transformContracts = require('./transformContracts')
const transformRoles =require('./transformRoles')