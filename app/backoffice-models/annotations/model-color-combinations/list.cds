using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinations with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [
            exteriorId,
            interiorId,
            roofId
        ],
        SortOrder     : [
            {
                $Type     : 'Common.SortOrderType',
                Property  : exteriorId,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : interiorId,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : roofId,
                Descending: false,
            },
        ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : exteriorId,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : interiorId,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : roofId,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: '8rem'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : exteriorDisplayName,
            ![@UI.Importance]: #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : interiorDisplayName,
            ![@UI.Importance]: #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : roofDisplayName,
            ![@UI.Importance]: #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
