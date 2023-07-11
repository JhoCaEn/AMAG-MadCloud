using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionConstraints with @UI: {
    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            equipment_id,
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : equipment_id,
                Descending : false,
            },
        ]
    },

    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : equipment_id,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
