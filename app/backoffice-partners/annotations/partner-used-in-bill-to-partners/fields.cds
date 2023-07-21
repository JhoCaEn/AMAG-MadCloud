using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInBillToPartners with {
    billToPartner @UI.Hidden; 

    brand   @title : '{i18n>Brand}';
    brand   @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };     
};

