using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerUsedInOrderControlsAsSoldToPartners with @(UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [
            vehicleUsage_code,
            customerState_code,
            endCustomerState_code
        ],
        SortOrder     : [
            {
                $Type     : 'Common.SortOrderType',
                Property  : vehicleUsage_code,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : customerState_code,
                Descending: false,
            },
            {
                $Type     : 'Common.SortOrderType',
                Property  : endCustomerState_code,
                Descending: false,
            },
        ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : vehicleUsage_code,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : customerState_code,
            ![@UI.Importance]: #High
        },
        {
            $Type            : 'UI.DataField',
            Value            : endCustomerState_code,
            ![@UI.Importance]: #Low
        },
        {
            $Type            : 'UI.DataField',
            Value            : createdAt,
            ![@UI.Importance]: #Low
        }
    ]
});
