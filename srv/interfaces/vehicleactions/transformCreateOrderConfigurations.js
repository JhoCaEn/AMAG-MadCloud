module.exports = (vehicle) => {
    if (!vehicle) 
        return []

    const brandCharacteristics = vehicle.brand?.characteristics?.reduce((result, { characteristic_code, value }) => ({ ...result, [characteristic_code]: value }), {}) || {}
    const equipmentCharacteristics = [
        brandCharacteristics.equipment ?? '',
        brandCharacteristics.internalWork ?? '',
        brandCharacteristics.additionalWork ?? ''
    ]

    const configurations = []
    const addToConfiguration = (Name, Value) => {
        if (Name && Value)
            configurations.push({ Name, Value })
    }

    addToConfiguration(brandCharacteristics.configurationDate, vehicle.configuredAt?.replace(/-/g, ''))
    addToConfiguration(brandCharacteristics.brand, vehicle.brand?.code)
    addToConfiguration(brandCharacteristics.salesType, vehicle.model?.salesType?.id)
    addToConfiguration(brandCharacteristics.engine, vehicle.model?.engine_id)
    addToConfiguration(brandCharacteristics.transmission, vehicle.model?.transmission_id)
    addToConfiguration(brandCharacteristics.model, vehicle.model?.technicalKey)
    addToConfiguration(brandCharacteristics.modelYear, vehicle.model?.year)
    addToConfiguration(brandCharacteristics.exteriorColor, vehicle.exteriorColor?.technicalKey)
    addToConfiguration(brandCharacteristics.interiorColor, vehicle.interiorColor?.technicalKey)
    addToConfiguration(brandCharacteristics.roofColor, vehicle.roofColor?.technicalKey)

    vehicle.equipments?.forEach(({ equipment: { technicalKey, chapter } = {} }) => {
        if (equipmentCharacteristics.includes(chapter?.characteristicName?.slice(0, 3)))
            addToConfiguration(chapter.characteristicName, technicalKey)
    })

    return configurations
}
