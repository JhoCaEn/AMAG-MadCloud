using AppOffersService as service from '.';

annotate service.Offers actions {
    selectSalesPartner   @Common.SideEffects: {
        TargetProperties: [
            'in/salesPartner_id',
            'in/hasSalesPartner',
            'in/brand_code'
        ],
        TargetEntities  : ['in/selectableBrands']
    };

    selectBrand            @Common.SideEffects: {TargetProperties: ['in/brand_code']};

    finishCarConfiguration @Common.SideEffects: {
        TargetProperties: [
            'in/carConfigurationIsValid',
            'in/carConfigurationConfiguredAt',
            'in/carConfigurationModel_id',
            'in/carConfigurationExteriorColor_id',
            'in/carConfigurationInteriorColor_id',
            'in/carConfigurationRoofColor_id'
        ],
        TargetEntities  : ['in/carConfigurationEquipments']
    };

};
