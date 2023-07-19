using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandShipToPartners with {
    brand   @UI.Hidden;
    partner @UI.Hidden;
};

annotate service.PartnerBrandShipToPartners with @Common.SemanticKey: [
    id,
    validFrom
];
