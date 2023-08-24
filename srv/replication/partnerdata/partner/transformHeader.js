module.exports = (raw) => ({
    id: raw.Partner,
    name: transformName(raw.Name1, raw.Name2) || null,
    fullName: raw?._DefaultAddress?.FullName,
    streetName: raw?._DefaultAddress?.StreetName,
    houseNumber: raw?._DefaultAddress?.HouseNumber,
    postalCode: raw?._DefaultAddress?.PostalCode,
    cityName: raw?._DefaultAddress?.CityName,
    phoneNumber: raw?._DefaultAddress?.PhoneNumber,
    emailAddress: raw?._DefaultAddress?.EmailAddress,
    isAMAGRetail: raw?.IsAMAGRetail || false,
    company: raw?.Name1,
    department: raw?.Name2
})

const transformName = (name1, name2) => name1 && name2 && /^amag/i.test(name1) ? name2 : name1