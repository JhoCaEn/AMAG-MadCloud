using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinations with {
    model               @UI.Hidden;
    exterior            @UI.Hidden;
    exteriorId          @title           : '{i18n>ExteriorColor}';
    exteriorId          @Common.ValueListWithFixedValues;
    exteriorId          @Common.ValueList: {
        CollectionPath: 'ModelExteriorColors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: exteriorId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: model.id,
                ValueListProperty: 'model_id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    };

    interior            @UI.Hidden;
    interiorId          @title           : '{i18n>InteriorColor}';
    interiorId          @Common.ValueListWithFixedValues;
    interiorId          @Common.ValueList: {
        CollectionPath: 'ModelInteriorColors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: interiorId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: model.id,
                ValueListProperty: 'model_id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    };

    roof                @UI.Hidden;
    roofId              @title           : '{i18n>RoofColor}';
    roofId              @Common.ValueListWithFixedValues;
    roofId              @Common.ValueList: {
        CollectionPath: 'ModelRoofColors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: roofId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: model.id,
                ValueListProperty: 'model_id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    };

    exteriorDisplayName @title           : '{i18n>BackofficeModels.exteriorDisplayName}';
    interiorDisplayName @title           : '{i18n>BackofficeModels.interiorDisplayName}';
    roofDisplayName     @title           : '{i18n>BackofficeModels.roofDisplayName}';
};

annotate service.ModelColorCombinations with @Common.SemanticKey: [
    model_id,
    exteriorId,
    interiorId,
    roofId
];

annotate service.ModelColorCombinations with @UI: {
    HeaderInfo                        : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>ColorCombination}',
        TypeNamePlural: '{i18n>ColorCombinations}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#HeaderTitle',
        },
    /*Description   : {
        $Type : 'UI.DataFieldForAnnotation',
        Target: '@UI.ConnectedFields#HeaderTitle',
    }*/
    },

    ConnectedFields #HeaderTitle      : {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{exteriorId} / {interiorId} / {roofId}',
        Data    : {
            $Type     : 'Core.Dictionary',
            exteriorId: {
                $Type: 'UI.DataField',
                Value: exteriorId,
            },
            interiorId: {
                $Type: 'UI.DataField',
                Value: interiorId,
            },
            roofId    : {
                $Type: 'UI.DataField',
                Value: roofId,
            },
        },
    },
    ConnectedFields #HeaderDescription: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{exteriorDisplayName} / {interiorDisplayName} / {roofDisplayName}',
        Data    : {
            $Type              : 'Core.Dictionary',
            exteriorDisplayName: {
                $Type: 'UI.DataField',
                Value: exteriorDisplayName,
            },
            interiorDisplayName: {
                $Type: 'UI.DataField',
                Value: interiorDisplayName,
            },
            roofDisplayName    : {
                $Type: 'UI.DataField',
                Value: roofDisplayName,
            },
        },
    },
};

annotate service.ModelColorCombinations with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validFrom,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : validTo,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : orderableFrom,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : orderableTo,
            AllowedExpressions: 'SingleRange',
        },

    ]
}};
