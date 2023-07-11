using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColors with @Common.SemanticKey: [color_id];

annotate service.ModelColors with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [color_id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : color_id,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : color_id,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : color.type_code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : color.displayName,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : modifiedAt,
            ![@UI.Importance]    : #High
        },
    ]
};