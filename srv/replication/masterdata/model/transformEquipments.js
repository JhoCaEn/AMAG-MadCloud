module.exports = (raw = [], brand_code) => {
    raw = raw.filter(({ _Equipment: { Equipment } = {} }) => !!Equipment)
    raw = raw.sort((a, b) => {
        if (a.ModelCodeWildcard < b.ModelCodeWildcard) return 1
        if (a.Assignment > b.Assignment) return 1

        return 0
    })

    const uniques = {}
    const transformed = []

    raw.forEach(entry => {
        if (uniques[entry._Equipment.Equipment])
            return

        uniques[entry._Equipment.Equipment] = true

        const equipment = {
            equipment_id: entry._Equipment.Equipment,
            isStandard: entry.IsStandard,
            validFrom: entry.ValidFrom || '1970-01-01',
            validTo: entry.ValidTo || '9999-12-31',
            orderableFrom: entry.OrderableFrom || entry.ValidFrom || '1970-01-01',
            orderableTo: entry.OrderableTo || entry.ValidTo || '9999-12-31',
            packageContent: transformPackageContent(entry._PackageContent),
            restrictions: [],
            salesPrices: []
        }

        equipment.isPackage = equipment.packageContent.length > 0
        equipment.restrictions.push(...transformEquipmentRestrictions(entry._Restrictions, brand_code))
        equipment.restrictions.push(...transformEquipmentConstraints(entry._ConstraintRestrictions, brand_code))
        equipment.salesPrices.push(...transformEquipmentsSalesPrices(entry._SalesPrices))
        equipment.salesPrices.push(...transformEquipmentsSalesPricesConstraints(entry._ConstraintSalesPrices))
        
        transformed.push(equipment)
    })

    return transformed
}

const transformPackageContent = (raw = []) => {
    const uniques = {}
    const transformed = []

    raw.forEach(entry => {
        if (!entry._Equipment?.Equipment)
            return

        if (uniques[entry._Equipment.Equipment])
            return

        uniques[entry._Equipment.Equipment] = true

        transformed.push({
            equipment_id: entry._Equipment.Equipment,
            place: entry.Place,
        })
    })

    return transformed
}

const transformEquipmentRestrictions = require('./transformEquipmentRestrictions')
const transformEquipmentConstraints = require('./transformEquipmentConstraints')
const transformEquipmentsSalesPrices = require('./transformEquipmentsSalesPrices')
const transformEquipmentsSalesPricesConstraints = require('./transformEquipmentsSalesPricesConstraints')