using AppSessionsService as service from '../../../srv';

annotate service.Sessions with @UI: {
    SelectionFields: [
        projectType_code,
        customerProjectNumber,
        fleetProjectNumber,
        ocd
    ],

    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            ID,
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : createdAt
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
            Value            : projectType_code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },            
        {
            $Type                : 'UI.DataField',
            Value                : customerProjectNumber,
            ![@UI.Importance]    : #Medium,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : fleetProjectNumber,
            ![@UI.Importance]    : #Medium,
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
