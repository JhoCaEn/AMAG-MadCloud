using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictions with @Common.SemanticKey: [equipment_id];

annotate service.ModelEquipmentRestrictions with {
    equipment  @UI.Hidden;
    constraint @title: '{i18n>ModelEquipmentRestrictions.Constraint}'
};
