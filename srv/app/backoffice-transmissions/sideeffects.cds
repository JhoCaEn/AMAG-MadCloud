using AppBackofficeTransmissionsService as service from '.';

annotate service.Transmissions actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}
