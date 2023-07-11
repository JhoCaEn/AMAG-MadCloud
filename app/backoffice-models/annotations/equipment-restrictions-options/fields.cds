using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionOptions with @Common.SemanticKey: [id];

annotate service.ModelEquipmentRestrictionOptions with {
    id          @title: '{i18n>Option}';
    restriction @UI.Hidden;
    createdAt   @UI.Hidden;
    modifiedAt  @UI.Hidden;
};
