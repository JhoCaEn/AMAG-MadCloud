using AppBackofficeEnginesService as service from '../../../../srv';

annotate service.Engines with @UI: {
    SelectionFields: [
        id,
        brand_code,
        fuelTypeId
    ],

    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            id,
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : id,
                Descending : false,
            },
        ]
    },

    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : id,
            ![@UI.Importance]: #High,
        },  
        {
            $Type            : 'UI.DataField',
            Value            : brand_code,
            ![@UI.Importance]: #Low,
        },            
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Medium,
            ![@HTML5.CssDefaults]: {width: 'auto'},
        },
        {
            $Type            : 'UI.DataField',
            Value            : unit,
            ![@UI.Importance]: #Low,
        },        
        {
            $Type            : 'UI.DataField',
            Value            : modifiedAt,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>General.Actions.synchronise}',
            Action: 'AppBackofficeEnginesService.synchronise'
        }
    ]
};
