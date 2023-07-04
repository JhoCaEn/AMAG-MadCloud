module.exports = (raw = {}) => {
    const transformed = Object.entries(raw).map(([key, value]) => {
        const transformed = {
            brand_code: key,
            validFrom: value.H_EINTRITT,
            validTo: value.H_AUSTRITT,
            contracts: transformContracts(key, value.VERTRAGSART)
        }

        transformed.hasContracts = !!transformed?.contracts?.length

        if (!transformed.validTo)
            transformed.validTo = transformed.validFrom
                ? '9999-12-31'
                : '1970-01-01'

        if (!transformed.validFrom)
            transformed.validFrom = '1970-01-01'

        return transformed
    })

    return transformed.filter(({ validTo }) => validTo !== '1970-01-01')
}


const transformContracts = require('./transformContracts')