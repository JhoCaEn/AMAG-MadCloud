using AppBackofficeModelsService as service from '../../../../srv';

annotate service.FuelTypes with {
    id    @title : '{i18n>FuelType}';
    id    @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };

    brand @title : '{i18n>Brand}';
    brand @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};