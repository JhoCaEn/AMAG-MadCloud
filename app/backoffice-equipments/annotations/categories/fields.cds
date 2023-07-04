using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Categories with {
    id    @title : '{i18n>BackofficeEquipments.EquipmentCategory}';
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