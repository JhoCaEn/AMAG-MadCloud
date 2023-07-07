using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentPackageContents with @Common.SemanticKey: [equipment_id];

annotate service.ModelEquipmentPackageContents with @UI: {
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
            Value            : place,
            ![@UI.Importance]: #Medium,
        }
    ]
};
