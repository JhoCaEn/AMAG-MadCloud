using AppBackofficePartnersService as service from '.';

annotate service.Partners actions {
    synchronise @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : ['in/brands']
    };
}
