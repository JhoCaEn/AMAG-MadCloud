using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.VehicleAvailabilities with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
