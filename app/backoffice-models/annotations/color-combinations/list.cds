using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinations with @Common.SemanticKey: [exterior_id];

annotate service.ModelColorCombinations with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [exterior_id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : exterior_id,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : exterior_id,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : interior_id,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : roof_id,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        }
    ]
};