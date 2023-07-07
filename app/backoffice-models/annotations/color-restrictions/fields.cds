using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictions with {
    colorCombination @UI.Hidden;
    type @title: '{i18n>General.type}';
    constraint @title: '{i18n>ModelColorRestrictions.constraint}';
    type @Common: {
        Text           : type.name,
        TextArrangement: #TextOnly
    };
};