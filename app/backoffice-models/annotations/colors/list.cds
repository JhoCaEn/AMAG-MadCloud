using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColors with @Common.SemanticKey: [id];

annotate service.ModelColors with @UI: {

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
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : type_code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : displayName,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};