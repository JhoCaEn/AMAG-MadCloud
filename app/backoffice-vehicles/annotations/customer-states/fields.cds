using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.CustomerStates with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
