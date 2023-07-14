using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColors with {
    color @UI.Hidden;
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
    model      @UI.Hidden;
};
