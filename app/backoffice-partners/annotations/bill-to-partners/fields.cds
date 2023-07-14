using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandBillToPartners with {
    brand @UI.Hidden;
    partner  @UI.Hidden;
};

annotate service.PartnerBrandBillToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BackofficePartners.PartnerBrandBillToPartner}',
    TypeNamePlural: '{i18n>BackofficePartners.PartnerBrandBillToPartners}',
}};