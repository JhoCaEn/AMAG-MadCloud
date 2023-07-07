using AppBackofficeColorsService as service from '../../../../srv';

annotate service.ModelColors with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [model_id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : model_id,
            Descending: false
        }]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : model_id,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : code,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : year,
            ![@UI.Importance]: #Low,
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'},
        },
    ]
};
