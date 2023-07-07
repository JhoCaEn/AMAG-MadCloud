using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.BrandCharacteristics with {
    brand          @UI.Hidden;
    characteristic @title : '{i18n>BrandCharacteristic}';
    characteristic @Common: {
        Text           : characteristic.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
}
