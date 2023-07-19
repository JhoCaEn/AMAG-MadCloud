using AppCallbacksService as service from '../../../../srv';

annotate service.Callbacks with @UI: {
    SelectionFields: [
        ID,
        semantic_code,
    ],

    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            createdAt,
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : createdAt,
                Descending : false,
            },
        ]
    },

    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : ID,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },  
        {
            $Type            : 'UI.DataField',
            Value            : semantic_code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },            
        {
            $Type                : 'UI.DataField',
            Value                : createdAt,
            ![@UI.Importance]    : #Medium,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
