using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.VehicleEchipments with {
    equipment @UI.Hidden;
    vehicle @UI.Hidden;
};

annotate service.VehicleEchipments with @Common.SemanticKey: [id];
