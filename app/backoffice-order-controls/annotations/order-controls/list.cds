using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.OrderControls with @UI: {
    SelectionFields: [
        vehicleUsage_code,
        customerState_code,
        endCustomerState_code
    ],

    PresentationVariant  : {
        $Type : 'UI.PresentationVariantType',
        Visualizations : ['@UI.LineItem'],
        RequestAtLeast : [
            vehicleUsage_code,
            customerState_code,
            endCustomerState_code
        ],
        SortOrder : [
            {
                $Type : 'Common.SortOrderType',
                Property : vehicleUsage_code,
                Descending : false,
            },
            {
                $Type : 'Common.SortOrderType',
                Property : customerState_code,
                Descending : false,
            },
            {
                $Type : 'Common.SortOrderType',
                Property : endCustomerState_code,
                Descending : false,
            }
        ]
    },

    LineItem       : [
        {
            $Type            : 'UI.DataField',
            Value            : vehicleUsage_code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },  
        {
            $Type            : 'UI.DataField',
            Value            : customerState_code,
            ![@UI.Importance]: #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },            
        {
            $Type                : 'UI.DataField',
            Value                : endCustomerState_code,
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
            Action: 'AppBackofficeOrderControlsService.synchronise'
        }
    ]
};
