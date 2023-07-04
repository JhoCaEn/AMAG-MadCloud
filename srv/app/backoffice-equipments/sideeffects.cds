using AppBackofficeEquipmentsService as service from '.';

annotate service.Equipments actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities: ['in/texts']
    };
};
