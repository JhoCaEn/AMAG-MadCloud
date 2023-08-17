using AppOrderReleasesService as service from '../../../../srv';

annotate service.OrderReleases with @UI: {
    SelectionFields    : [ID],

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [ID, ],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : ID,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : ID,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : erpID,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : brand_code,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : model_id,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                    : 'UI.DataFieldForAction',
            Label                    : '{i18n>OrderReleases.Actions.reject}',
            Action                   : 'AppOrderReleasesService.rejectOrder',
            Inline                   : true,
            Determining              : true,
            Criticality              : 1,
            CriticalityRepresentation: 1
        },
        {
            $Type                    : 'UI.DataFieldForAction',
            Label                    : '{i18n>OrderReleases.Actions.approve}',
            Action                   : 'AppOrderReleasesService.approveOrder',
            Inline                   : true,
            Determining              : true,
            Criticality              : 3,
            CriticalityRepresentation: 1
        }
    ]
};
