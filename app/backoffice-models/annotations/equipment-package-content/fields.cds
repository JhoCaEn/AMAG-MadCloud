using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentPackageContents with {
    equipment @title: '{i18n>Equipment}';
    place     @title: '{i18n>ModelEquipmentPackageContents.place}';
};
