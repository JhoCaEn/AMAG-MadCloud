using AppBackofficeVehiclesService as service from '.';

annotate service.Vehicles actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/equipments']
    };
}