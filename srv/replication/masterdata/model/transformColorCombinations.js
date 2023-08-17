module.exports = (raw = [], brand_code) => {
    raw = raw.sort((a, b) => {
        if (a.ModelCodeWildcard < b.ModelCodeWildcard) return 1
        if (a.Assignment > b.Assignment) return 1

        return 0
    })

    const uniques = {}
    const transformed = []

    const uniqueKey = (exterior_id, interior_id, roof_id) => `${exterior_id ?? ''}_${interior_id ?? ''}_${roof_id ?? ''}`

    raw.forEach(entry => {
        if (uniques[uniqueKey(entry._Exterior?.Color, entry._Interior?.Color, entry._Roof?.Color)])
            return

        uniques[uniqueKey(entry._Exterior?.Color, entry._Interior?.Color, entry._Roof?.Color)] = true

        const combination = {
            exterior_id: entry._Exterior?.Color ?? '',
            interior_id: entry._Interior?.Color ?? '',
            roof_id: entry._Roof?.Color ?? '',
            validFrom: entry.ValidFrom || '1970-01-01',
            validTo: entry.ValidTo || '9999-12-31',
            orderableFrom: entry.OrderableFrom || entry.ValidFrom || '1970-01-01',
            orderableTo: entry.OrderableTo || entry.ValidTo || '9999-12-31',
            restrictions: [],
            salesPrices: []
        }

        combination.restrictions.push(...transformColorCombinationsRestrictions(entry._Restrictions, brand_code))
        combination.restrictions.push(...transformColorCombinationsConstraints(entry._ConstraintRestrictions, brand_code))

        Object.entries(salesPriceMapping).forEach(([type_code, expands]) => {
            const salesPrices = []

            salesPrices.push(...transformColorCombinationsSalesPrices(entry[expands.normal], type_code))
            salesPrices.push(...transformColorCombinationsSalesPrices(entry[expands.contraint], type_code))

            salesPrices.sort((a, b) => a.weighting < b.weighting ? -1 : 1).forEach((price, index) => price.weighting = index)

            combination.salesPrices.push(...salesPrices)
        })

        transformed.push(combination)
    })

    return transformed
}

const transformColorCombinationsRestrictions = require('./transformColorCombinationsRestrictions')
const transformColorCombinationsConstraints = require('./transformColorCombinationsConstraints')
const transformColorCombinationsSalesPrices = require('./transformColorCombinationsSalesPrices')

const salesPriceMapping = {
    E: {
        normal: '_ExteriorSalesPrices',
        contraint: '_ExteriorConstraintSalesPrices'
    },
    I: {
        normal: '_InteriorSalesPrices',
        contraint: '_InteriorConstraintSalesPrices'
    },
    R: {
        normal: '_RoofSalesPrices',
        constraint: '_RoofConstraintSalesPrices'
    }
}
