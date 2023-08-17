using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.VehicleUsages with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
