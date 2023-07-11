using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionConstraints with @Common.SemanticKey: [equipment_id ];

annotate service.ModelEquipmentRestrictionConstraints with {
    equipment   @title: '{i18n>Equipment}';
    restriction @UI.Hidden;
    createdAt   @UI.Hidden;
    modifiedAt  @UI.Hidden;
};
