using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictions with {
    colorCombination @UI.Hidden;
    type @Common: {
        Text           : type.name,
        TextArrangement: #TextOnly
    };
};