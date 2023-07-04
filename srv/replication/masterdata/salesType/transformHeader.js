module.exports = (raw) => ({
    brand_code: raw.Brand,
    id: raw.Type,
    material: raw.Material,
    salesOrganisation: raw.SalesOrganization,
    modelSeries_brand_code: raw._ModelSeries?.Brand,
    modelSeries_id: raw._ModelSeries?.ModelSeries
})