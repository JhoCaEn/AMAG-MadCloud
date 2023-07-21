using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInShipToPartners with {
    shipToPartner @UI.Hidden; 

    brand   @title : '{i18n>Brand}';
    brand   @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };     
};

