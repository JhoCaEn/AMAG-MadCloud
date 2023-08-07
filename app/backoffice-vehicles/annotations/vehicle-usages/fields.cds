using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.VehicleUsages with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
