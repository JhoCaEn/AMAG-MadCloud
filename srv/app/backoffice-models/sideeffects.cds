using AppBackofficeModelsService as service from '.';

annotate service.Models actions {
    synchroniseModels @Common.SideEffects: {
        TargetProperties: ['in'],
        TargetEntities  : [
            'in/texts', 
            'in/colors',
            'in/colorCombinations',
            'in/equipments',
            'in/salesPrices',
            'in/restrictions'
        ]
    };
};
