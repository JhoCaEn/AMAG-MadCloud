using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionOptions with {
    restriction @UI.Hidden;
};

annotate service.ModelEquipmentRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>RestrictionOption}',
    TypeNamePlural: '{i18n>RestrictionOptions}',
}};

annotate service.ModelEquipmentRestrictionOptions with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
    ]
}};
