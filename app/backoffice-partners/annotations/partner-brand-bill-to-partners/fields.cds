using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrandBillToPartners with {
    brand   @UI.Hidden;
    partner @UI.Hidden;
};

annotate service.PartnerBrandBillToPartners with @Common.SemanticKey: [
    id,
    validFrom
];