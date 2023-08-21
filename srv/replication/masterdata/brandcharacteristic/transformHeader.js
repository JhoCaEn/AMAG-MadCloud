module.exports = (raw = {}) => {
    if (!characteristics[raw?.Type] || !raw?.Name) return null 

    return {
        brand_code: raw?.Brand,
        characteristic_code: characteristics[raw?.Type],
        value: raw?.Name
    }
}

const characteristics = {
    DA: 'configurationDate',
    MA: 'brand',
    TY: 'salesType',
    MO: 'engine',
    GE: 'transmission',
    MD: 'model',
    MJ: 'modelYear',
    AU: 'exteriorColor',
    IN: 'interiorColor',
    VD: 'roofColor',
    K1: 'equipment',
    Z1: 'internalWork',
    Z2: 'additionalWork'
}