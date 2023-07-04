module.exports = (raw) => ({
    id: raw.Equipment,
    code: raw.Code,
    technicalKey: raw.TechnicalKey,
    chapter_brand_code: raw._Chapter?.Brand,
    chapter_id: raw._Chapter?.Chapter,
    category_brand_code: raw._Category?.Brand || null,
    category_id: raw._Category?.Category || null,
    brand_code: raw.Brand
})