using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandPaidByPartners with {
    brand @UI.Hidden;
    partner  @UI.Hidden;
};

annotate service.PartnerBrandPaidByPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BackofficePartners.PartnerBrandPaidByPartner}',
    TypeNamePlural: '{i18n>BackofficePartners.PartnerBrandPaidByPartners}',
}};