using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelRestrictionRules with {
    restriction @UI.Hidden;
    category @Common: {
        Text           : category.name,
        TextArrangement: #TextOnly
    };
};