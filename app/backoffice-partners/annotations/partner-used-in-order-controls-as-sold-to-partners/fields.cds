using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInOrderControlsAsSoldToPartners with {
    soldToPartner @UI.Hidden;
    
    vehicleUsage     @Common          : {
        Text           : vehicleUsage.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    customerState    @Common          : {
        Text           : customerState.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    endCustomerState @Common          : {
        Text           : endCustomerState.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
};

