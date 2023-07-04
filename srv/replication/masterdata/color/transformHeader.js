const types = { AU: 'E', IN: 'I', VD: 'R' }

module.exports = (raw) => ({
    id: raw.Color,
    code: raw.Code,
    type_code: types[raw.Type] || null,
    technicalKey: raw.TechnicalKey,
    brand_code: raw.Brand
})
