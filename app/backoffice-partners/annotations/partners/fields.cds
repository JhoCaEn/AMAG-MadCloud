using AppBackofficePartnersService as service from '../../../../srv';

annotate service.Partners with {
    id        @UI.hidden;
    partnerId @title : '{i18n>General.ID}';
};

annotate service.Partners with @Capabilities : {FilterRestrictions : {
    $Type                        : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions : [
        {
            $Type              : 'Capabilities.FilterExpressionRestrictionType',
            Property           : validFrom,
            AllowedExpressions : 'SingleRange',
        },
        {
            $Type              : 'Capabilities.FilterExpressionRestrictionType',
            Property           : validTo,
            AllowedExpressions : 'SingleRange',
        },
        {
            $Type              : 'Capabilities.FilterExpressionRestrictionType',
            Property           : createdAt,
            AllowedExpressions : 'SingleRange',
        },
        {
            $Type              : 'Capabilities.FilterExpressionRestrictionType',
            Property           : modifiedAt,
            AllowedExpressions : 'SingleRange',
        },

    ]
}};
