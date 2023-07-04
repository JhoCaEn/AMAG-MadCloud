module.exports = (raw) => ({
    id: raw.Transmission,
    gears: raw.Gears,
    driveType_brand_code: raw._DriveType?.Brand || null,
    driveType_id: raw._DriveType?.Type || null,
    type_brand_code: raw._Type?.Brand || null,
    type_id: raw._Type?.Type || null,
    brand_code: raw.Brand
})