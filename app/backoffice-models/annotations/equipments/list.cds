using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipments with @Common.SemanticKey: [equipment_id];

annotate service.ModelEquipments with @UI: {
    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            equipment_id,
        ]
    },

    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : equipment_id,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : isStandard,
            ![@UI.Importance]: #Medium,
        },
                {
            $Type            : 'UI.DataField',
            Value            : isPackage,
            ![@UI.Importance]: #High,
        }
    ]
};
