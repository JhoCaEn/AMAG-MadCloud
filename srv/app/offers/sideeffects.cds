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
            'in/configuredAt',
            'in/model_id',
            'in/exteriorColor_id',
            'in/exteriorColorSalesPriceConstraintEquipment_id',
            'in/exteriorColorSalesPriceConstraintColor_id',
            'in/interiorColor_id',
            'in/interiorColorSalesPriceConstraintEquipment_id',
            'in/interiorColorSalesPriceConstraintColor_id',
            'in/roofColor_id',
            'in/roofColorSalesPriceConstraintEquipment_id',
            'in/roofColorSalesPriceConstraintColor_id'
        ],
        TargetEntities  : ['in/equipments']
    };

};
