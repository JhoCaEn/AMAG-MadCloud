using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandPaidByPartners with {
    brand   @UI.Hidden;
    partner @UI.Hidden;
};

annotate service.PartnerBrandPaidByPartners with @Common.SemanticKey: [
    id,
    validFrom
];
