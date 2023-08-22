using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrands with {
    partner         @UI.Hidden;
    dealerPartner   @UI.Hidden;
    brand           @title : '{i18n>Brand}';
    dealerPartnerID @title : '{i18n>Partner.dealerPartner}';
    brand           @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};

annotate service.PartnerBrands with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BackofficePartners.PartnerBrand}',
    TypeNamePlural: '{i18n>BackofficePartners.PartnerBrands}',
}};

annotate service.PartnerBrands with @Capabilities: {FilterRestrictions: {
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
    ]
}};
