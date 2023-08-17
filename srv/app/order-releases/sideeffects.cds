using AppOrderReleasesService as service from '.';

annotate service.OrderReleases actions {
    approveOrder @Common.SideEffects: {
        TargetProperties: ['in/orderReleased'],
        TargetEntities  : []
    };

    rejectOrder  @Common.SideEffects: {
        TargetProperties: ['in/orderCreated'],
        TargetEntities  : []
    };

}
