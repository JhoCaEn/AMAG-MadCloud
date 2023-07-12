using AppBackofficeColorsService as service from '../../../../srv';

annotate service.ModelColors with @Common.SemanticKey: [id];

annotate service.ModelColors with {
    color @UI.Hidden;
};
