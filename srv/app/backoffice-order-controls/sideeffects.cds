using AppBackofficeOrderControlsService as service from '.';

annotate service.OrderControls actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in']
    };
}