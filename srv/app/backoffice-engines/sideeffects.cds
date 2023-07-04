using AppBackofficeEnginesService as service from '.';

annotate service.Engines actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/texts']
    };
}