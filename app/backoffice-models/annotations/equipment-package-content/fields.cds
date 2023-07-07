using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentPackageContents with {
    package   @UI.Hidden;
    equipment @title : '{i18n>Equipment}';
    place     @title : '{i18n>ModelEquipmentPackageContents.place}';
    equipment @Common: {
        Text           : equipment.name,
        TextArrangement: #TextOnly
    };
};
