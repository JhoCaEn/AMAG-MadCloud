using AppCallbacksService as service from '../../../../srv';

annotate service.Callbacks with {
    semantic   @Core.Immutable;
    semantic   @Common: {
        Text           : semantic.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    parameters @(UI: {MultiLineText});
};
