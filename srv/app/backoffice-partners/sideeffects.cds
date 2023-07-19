using AppBackofficePartnersService as service from '.';

annotate service.Partners actions {
    synchronise @Common.SideEffects: {TargetEntities: [
        'in',
        'in/brands'
    ]};
}
