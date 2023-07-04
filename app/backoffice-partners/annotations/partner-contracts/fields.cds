using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandContracts with {
    brand @UI.Hidden;
    type  @title : '{i18n>BackofficePartners.PartnerBrandContract}';
    type  @Common: {
        Text           : type.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    type  @UI.HiddenFilter;
};

annotate service.PartnerBrandContracts with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BackofficePartners.PartnerBrandContract}',
    TypeNamePlural: '{i18n>BackofficePartners.PartnerBrandContracts}',
}};
