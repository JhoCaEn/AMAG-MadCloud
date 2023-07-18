using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.BrandCharacteristics with @UI: {

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [code],
        SortOrder     : [{
            Property  : name,
            Descending: false
        }]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : code,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : value,
            ![@UI.Importance]: #High,
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
            Action: 'AppBackofficeBrandsService.synchroniseCharacteristic'
        }
    ]
};
