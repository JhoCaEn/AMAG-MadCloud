using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptions with {
    restriction @UI.Hidden;
    id @title: '{i18n>General.ID}';
};