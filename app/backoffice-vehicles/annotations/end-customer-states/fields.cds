using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.EndCustomerStates with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
