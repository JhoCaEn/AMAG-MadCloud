using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictionOptionRules with @UI: {
    PresentationVariant: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: ['@UI.LineItem'],
        RequestAtLeast: [id],
        SortOrder     : [{
            $Type     : 'Common.SortOrderType',
            Property  : id,
            Descending: false,
        }]
    },

    LineItem           : [
        {
            $Type                : 'UI.DataField',
            Value                : id,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : categoryId,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type         : 'UI.DataFieldWithIntentBasedNavigation',
            Value         : color_id,
            Label         : '{i18n>Color}',
            SemanticObject: 'DWBBOColor',
            Action        : 'manage',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : color_id,
                SemanticObjectProperty: 'id',
            }, ]
        },
        {
            $Type                : 'UI.DataField',
            Value                : equipment_id,
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : isRequired,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        },
        {
            $Type                : 'UI.DataField',
            Value                : isForbidden,
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {width: 'auto'}
        }
    ]
};
