using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinations with {
    exterior @title: '{i18n>ModelColorCombinations.exterior}';
    interior @title: '{i18n>ModelColorCombinations.interior}';
    roof     @title: '{i18n>ModelColorCombinations.roof}';
    model    @UI.Hidden;
};
