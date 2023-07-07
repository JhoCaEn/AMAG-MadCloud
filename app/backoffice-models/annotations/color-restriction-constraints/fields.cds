using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionConstraints with {
    restriction @UI.Hidden;
    equipment @title: '{i18n>Equipment}';
    equipment @Common: {
        Text           : equipment.name,
        TextArrangement: #TextOnly
    };
};