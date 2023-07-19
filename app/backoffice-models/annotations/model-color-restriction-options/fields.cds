using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictionOptions with {
    restriction @UI.Hidden;
};

annotate service.ModelColorRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>RestrictionOption}',
    TypeNamePlural: '{i18n>RestrictionOptions}',
}};

annotate service.ModelColorRestrictionOptions with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
    ]
}};