using AppBackofficePartnersService as service from '../../../../srv';

annotate service.Partners with {
    id        @UI.Hidden;
    partnerId @title: '{i18n>General.ID}';
};

annotate service.Partners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Partner}',
    TypeNamePlural: '{i18n>Partners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: partnerId
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};

annotate service.Partners with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validFrom,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validTo,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : modifiedAt,
            AllowedExpressions: 'SingleRange',
        },

    ]
}};
