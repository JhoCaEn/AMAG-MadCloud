using AppCallbacksService as service from '../../../../srv';

annotate service.SemanticObjects with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
