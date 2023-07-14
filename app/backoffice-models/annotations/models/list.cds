using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Models with @Common.SemanticKey: [id];

annotate service.Models with @UI: {
    SelectionFields    : [
        id,
        year,
        code,
        brand_code
    ],

    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id, ],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : id,
            Descending: false,
        }, ]
    },

    LineItem           : [
        {
            $Type            : 'UI.DataField',
            Value            : id,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : year,
            ![@UI.Importance]: #Medium,
        },
        {
            $Type            : 'UI.DataField',
            Value            : code,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Value            : brand_code,
            ![@UI.Importance]: #High,
        },
        {
            $Type                : 'UI.DataField',
            Value                : name,
            ![@UI.Importance]    : #Medium,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type            : 'UI.DataField',
            Value            : modifiedAt,
            ![@UI.Importance]: #Low,
        },
        {
            $Type         : 'UI.DataFieldWithIntentBasedNavigation',
            Value         : engine_id,
            Label         : '{i18n>Engine}',
            SemanticObject: 'DWBBOEngine',
            Action        : 'manage',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : engine_id,
                SemanticObjectProperty: 'id',
            }]
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : '{i18n>General.Actions.synchronise}',
            Action: 'AppBackofficeModelsService.synchroniseModels'
        }
    ]
};
