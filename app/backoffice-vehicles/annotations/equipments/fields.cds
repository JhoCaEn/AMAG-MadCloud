using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.VehicleEquipments with {
    equipment @UI.Hidden;
    vehicle @UI.Hidden;
};

annotate service.VehicleEquipments with @Common.SemanticKey: [id];
