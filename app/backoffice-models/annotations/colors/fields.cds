using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColors with {
    color      @title: '{i18n>ModelColors.color}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
    model      @UI.Hidden;
};
