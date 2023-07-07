using AppBackofficeColorsService as service from '../../../../srv';

annotate service.Colors with {
    type  @title : '{i18n>BackofficeColors.ColorType}';
    type  @Common: {
        Text           : type.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    brand @title : '{i18n>Brand}';
    brand @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};


annotate service.Colors with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
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
