using AppBackofficeModelsService as service from '../../../../srv';

annotate service.EquipmentChapters with {
    brand @UI.Hidden;
    id    @title : '{i18n>EquipmentChapter}';
    id    @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
