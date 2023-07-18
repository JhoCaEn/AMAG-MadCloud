using AppBackofficeModelsService as service from '../../../../srv';

annotate service.EquipmentCategories with {
    brand @UI.Hidden;
    id    @title : '{i18n>EquipmentCategory}';
    id    @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
