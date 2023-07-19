using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentPackageContents with @UI: {
    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            place,
        ],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : place,
            Descending: false,
        }, ]
    },

    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : id,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : displayName,
            ![@UI.Importance]: #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },        
        {
            $Type            : 'UI.DataField',
            Value            : place,
            ![@UI.Importance]: #Medium,
        }
    ]
};
