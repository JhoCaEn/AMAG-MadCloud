using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictions with {
    equipment         @UI.Hidden;
    constraint        @UI.Hidden;
    constraintDisplay @title: '{i18n>Constraint}';
};

annotate service.ModelEquipmentRestrictions with @Common.SemanticKey: [
    equipment_equipment_id,
    constraintDisplay
];

annotate service.ModelEquipmentRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Restriction}',
    TypeNamePlural: '{i18n>Restrictions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: constraintDisplay
    }
}};

annotate service.ModelEquipmentRestrictions with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [{
        $Type             : 'Capabilities.FilterExpressionRestrictionType',
        Property          : createdAt,
        AllowedExpressions: 'SingleRange',
    }]
}};
