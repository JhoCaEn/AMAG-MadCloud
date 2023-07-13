using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandShipToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BackofficePartners.PartnerBrandShipToPartner}',
    TypeNamePlural: '{i18n>BackofficePartners.PartnerBrandShipToPartners}',
}};