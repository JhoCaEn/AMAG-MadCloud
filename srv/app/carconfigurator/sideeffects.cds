using AppCarConfiguratorService as service from '.';

annotate service.Configurations actions {
    prepare           @Common.SideEffects: {
        TargetProperties: [
            'in/isPrepared',
            'in/model_id',            
            'in/exteriorColor_id',
            'in/interiorColor_id',
            'in/roofColor_id',
            'in/preselectedModel_id',
            'in/preselectedExteriorColor_id',
            'in/preselectedInteriorColor_id',
            'in/preselectedRoofColor_id',
            'in/hasSelectableExteriorColors',
            'in/hasSelectableInteriorColors',
            'in/hasSelectableRoofColors',
            'in/hasValidColorCombination'
        ],
        TargetEntities  : [
            'in/selectableModelCategories',
            'in/selectableSalesTypes',
            'in/selectableModels',
            'in/preselectedEquipments',
            'in/equipments',
            'in/selectableEquipments',
            'in/selectableEquipmentCategories',
            'in/selectableColors',
            'in/selectableColorTypes',
            'in/selectableColorCombinations',
            'in/selectableEquipmentChapters',
            'in/selectableModelRestrictions',
            'in/modelSalesPrice',
            'in/exteriorColorSalesPrice',
            'in/interiorColorSalesPrice',
            'in/roofColorSalesPrice'            
        ]
    };

    selectModel       @Common.SideEffects: {
        TargetProperties: [
            'in/model_id',
            'in/hasSelectableExteriorColors',
            'in/hasSelectableInteriorColors',
            'in/hasSelectableRoofColors',
            'in/exteriorColorSalesPriceConstraintEquipment_id',
            'in/exteriorColorSalesPriceConstraintColor_id',
            'in/interiorColorSalesPriceConstraintEquipment_id',
            'in/interiorColorSalesPriceConstraintColor_id',
            'in/roofColorSalesPriceConstraintEquipment_id',
            'in/roofColorSalesPriceConstraintColor_id'
        ],
        TargetEntities  : [
            'in/selectableModels',
            'in/selectableColors',
            'in/selectableColorTypes',
            'in/selectableColorCombinations',
            'in/selectableEquipments',
            'in/selectableEquipmentChapters',
            'in/selectableEquipmentCategories',
            'in/selectableModelRestrictions',
            'in/modelSalesPrice',
            'in/exteriorColorSalesPrice',
            'in/interiorColorSalesPrice',
            'in/roofColorSalesPrice'
        ]
    };

    selectColor       @Common.SideEffects: {
        TargetProperties: [
            'in/exteriorColor_id',
            'in/interiorColor_id',
            'in/roofColor_id',
            'in/hasValidColorCombination',
            'in/exteriorColorSalesPriceConstraintEquipment_id',
            'in/exteriorColorSalesPriceConstraintColor_id',
            'in/interiorColorSalesPriceConstraintEquipment_id',
            'in/interiorColorSalesPriceConstraintColor_id',
            'in/roofColorSalesPriceConstraintEquipment_id',
            'in/roofColorSalesPriceConstraintColor_id'
        ],
        TargetEntities  : [
            'in/selectableColorTypes',
            'in/selectableColors',
            'in/exteriorColorSalesPrice',
            'in/interiorColorSalesPrice',
            'in/roofColorSalesPrice'
        ]
    };

    unselectColor     @Common.SideEffects: {
        TargetProperties: [
            'in/exteriorColor_id',
            'in/interiorColor_id',
            'in/roofColor_id',
            'in/hasValidColorCombination',
            'in/exteriorColorSalesPriceConstraintEquipment_id',
            'in/exteriorColorSalesPriceConstraintColor_id',
            'in/interiorColorSalesPriceConstraintEquipment_id',
            'in/interiorColorSalesPriceConstraintColor_id',
            'in/roofColorSalesPriceConstraintEquipment_id',
            'in/roofColorSalesPriceConstraintColor_id'
        ],
        TargetEntities  : [
            'in/selectableColorTypes',
            'in/selectableColors',
            'in/exteriorColorSalesPrice',
            'in/interiorColorSalesPrice',
            'in/roofColorSalesPrice'
        ]
    };

    selectEquipment   @Common.SideEffects: {
        TargetProperties: [
            'in/exteriorColorSalesPriceConstraintEquipment_id',
            'in/exteriorColorSalesPriceConstraintColor_id',
            'in/interiorColorSalesPriceConstraintEquipment_id',
            'in/interiorColorSalesPriceConstraintColor_id',
            'in/roofColorSalesPriceConstraintEquipment_id',
            'in/roofColorSalesPriceConstraintColor_id'
        ],
        TargetEntities  : [
            'in/equipments',
            'in/selectableEquipments',
            'in/selectableEquipmentCategories',
            'in/exteriorColorSalesPrice',
            'in/interiorColorSalesPrice',
            'in/roofColorSalesPrice'
        ]
    };

    unselectEquipment @Common.SideEffects: {
        TargetProperties: [
            'in/exteriorColorSalesPriceConstraintEquipment_id',
            'in/exteriorColorSalesPriceConstraintColor_id',
            'in/interiorColorSalesPriceConstraintEquipment_id',
            'in/interiorColorSalesPriceConstraintColor_id',
            'in/roofColorSalesPriceConstraintEquipment_id',
            'in/roofColorSalesPriceConstraintColor_id'
        ],
        TargetEntities  : [
            'in/equipments',
            'in/selectableEquipments',
            'in/selectableEquipmentCategories',
            'in/exteriorColorSalesPrice',
            'in/interiorColorSalesPrice',
            'in/roofColorSalesPrice'
        ]        
    };

}
