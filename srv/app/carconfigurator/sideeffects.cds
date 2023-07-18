using AppCarConfiguratorService as service from '.';

annotate service.Configurations actions {
    prepare           @Common.SideEffects: {
        TargetProperties: [
            'in/isPrepared',
            'in/model_id',
            'in/exteriorColor_id',
            'in/interiorColor_id',
            'in/roofColor_id'
        ],
        TargetEntities  : [
            'in/selectableModelCategories',
            'in/selectableSalesTypes',
            'in/selectableModels',
            'in/selectableModelsSalesPrices',
            'in/equipments',
            'in/selectableEquipments',
            'in/selectableEquipmentCategories'
        ]
    };

    selectModel       @Common.SideEffects: {
        TargetProperties: [
            'in/model_id',
            'in/hasSelectableExteriorColors',
            'in/hasSelectableInteriorColors',
            'in/hasSelectableRoofColors'
        ],
        TargetEntities  : [
            'in/selectableModels',
            'in/selectableColors',
            'in/selectableColorTypes',
            'in/selectableColorCombinations',
            'in/selectableEquipments',
            'in/selectableEquipmentChapters',
            'in/selectableEquipmentCategories',
            'in/selectableModelRestrictions'
        ]
    };

    selectColor       @Common.SideEffects: {
        TargetProperties: [
            'in/exteriorColor_id',
            'in/interiorColor_id',
            'in/roofColor_id',
            'in/hasValidColorCombination',
            'in/selectableColorTypes'
        ],
        TargetEntities  : ['in/selectableColors']
    };

    unselectColor     @Common.SideEffects: {
        TargetProperties: [
            'in/exteriorColor_id',
            'in/interiorColor_id',
            'in/roofColor_id',
            'in/hasValidColorCombination',
            'in/selectableColorTypes'
        ],
        TargetEntities  : ['in/selectableColors']
    };

    selectEquipment   @Common.SideEffects: {TargetEntities: [
        'in/equipments',
        'in/selectableEquipments',
        'in/selectableEquipmentCategories'
    ]};

    unselectEquipment @Common.SideEffects: {TargetEntities: [
        'in/equipments',
        'in/selectableEquipments',
        'in/selectableEquipmentCategories'
    ]};

}
