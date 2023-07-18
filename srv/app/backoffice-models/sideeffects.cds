using AppBackofficeModelsService as service from '.';

annotate service.Models actions {
    synchronise @Common.SideEffects: {
        TargetEntities  : [
            'in',
            'in/texts', 
            'in/colors',
            'in/exteriorColors',
            'in/interiorColors',
            'in/roofColors',
            'in/colorCombinations',
            'in/equipments',
            'in/salesPrices',
            'in/restrictions'
        ]
    };
};
