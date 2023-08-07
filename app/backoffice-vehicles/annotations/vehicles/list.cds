using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.Vehicles with @UI: {
    SelectionFields: [
        ID
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
                Property : ID,
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
            Value            : modifiedAt,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>General.Actions.synchronise}',
            Action: 'AppBackofficeVehiclesService.synchronise'
        }
    ]
};