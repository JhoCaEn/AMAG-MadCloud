using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInSoldToPartners with {
    soldToPartner @UI.Hidden; 

    brand   @title : '{i18n>Brand}';
    brand   @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };     
};

