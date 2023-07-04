using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.TransmissionTypes with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id],
        SortOrder     : [{
            Property  : id,
            Descending: false,
        }, ],
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : id,
            ![@UI.Importance]    : #High
        },
        {
            $Type                : 'UI.DataField',
            Value                : shift_code,
            ![@UI.Importance]    : #Low
        },        
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : modifiedAt,
            ![@UI.Importance]: #High,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>General.Actions.synchronise}',
            Action: 'AppBackofficeBrandsService.synchroniseTransmissionType'
        },        
    ],
};
