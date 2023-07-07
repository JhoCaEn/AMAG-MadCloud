using AppBackofficeColorsService as service from '.';

annotate service.Colors actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}