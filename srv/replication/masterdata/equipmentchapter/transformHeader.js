module.exports = (raw) => ({
    brand_code: raw.Brand,
    id: raw.Chapter,
    characteristicName: raw.CharacteristicName,
    isVisible: raw.IsVisible,
    isVisibleInConfigurator: raw.IsVisibleInConfigurator,
    isVisibleInSellingSystem: raw.IsVisibleInSellingSystem
})