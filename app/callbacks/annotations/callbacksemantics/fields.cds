using AppCallbacksService as service from '../../../../srv';

annotate service.CallbackSemantics with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
