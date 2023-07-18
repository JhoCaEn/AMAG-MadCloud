using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelCategories with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
}