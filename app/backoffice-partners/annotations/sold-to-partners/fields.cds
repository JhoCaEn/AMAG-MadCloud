using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandSoldToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BackofficePartners.PartnerBrandSoldToPartner}',
    TypeNamePlural: '{i18n>BackofficePartners.PartnerBrandSoldToPartners}',
}};