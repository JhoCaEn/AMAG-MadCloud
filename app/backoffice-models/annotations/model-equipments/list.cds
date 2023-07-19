using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipments with @UI: {
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : id,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : id,
            ![@UI.Importance]: #High
        },
        {
            $Type                : 'UI.DataField',
            Value                : displayName,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : isPackage,
            ![@UI.Importance]: #Low
        },        
        {
            $Type            : 'UI.DataField',
            Value            : chapterId,
            ![@UI.Importance]: #Low
        },
    ]
};
