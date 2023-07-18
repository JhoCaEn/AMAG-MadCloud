using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelRestrictions with {
    model @UI.Hidden;
};

annotate service.ModelRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>RestrictionOption}',
    TypeNamePlural: '{i18n>RestrictionOptions}',
}};

annotate service.ModelRestrictions with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
    ]
}};