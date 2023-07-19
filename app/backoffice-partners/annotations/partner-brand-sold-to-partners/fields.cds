using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandSoldToPartners with {
    brand   @UI.Hidden;
    partner @UI.Hidden;
};

annotate service.PartnerBrandSoldToPartners with @Common.SemanticKey: [
    id,
    validFrom
];
