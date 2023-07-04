module.exports = (raw) => ({
    id: raw.Engine,
    capacity: raw.Capacity,
    powerHP: raw.PowerHP,
    powerKW: raw.PowerKW,
    cylinders: raw.Cylinders,
    brand_code: raw.Brand,
    fuelType_brand_code: raw._FuelType?.Brand || null,
    fuelType_id: raw._FuelType?.Type || null
})