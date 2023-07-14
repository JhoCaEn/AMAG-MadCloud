using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Brands with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
}

annotate service.Models with {
    brand @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    bodyType @UI.Hidden;
    bodyTypeId @title: '{i18n>BodyType}';
    bodyTypeId @Common: {
        Text           : bodyType.name,
        TextArrangement: #TextOnly
    };
    bodyTypeId @Common.ValueList: {
        CollectionPath: 'BodyTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: bodyTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: bodyType_name,
                ValueListProperty: 'name'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            }
        ]
    };

    salesType @UI.Hidden;
    salesTypeId @title: '{i18n>SalesType}';
    salesTypeId @Common: {
        Text           : salesType.name,
        TextArrangement: #TextOnly
    };
    salesTypeId @Common.ValueList: {
        CollectionPath: 'SalesTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: salesTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: salesType_name,
                ValueListProperty: 'name'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            }
        ]
    };

    modelSeries @UI.Hidden;
    modelSeriesId @title: '{i18n>ModelSerie}';
    modelSeriesId @Common: {
        Text           : modelSeries.name,
        TextArrangement: #TextOnly
    };
    modelSeriesId @Common.ValueList: {
        CollectionPath: 'ModelSeries',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: modelSeriesId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: modelSeries_name,
                ValueListProperty: 'name'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            }
        ]
    };


    engine @Common: {
        Text           : engine.name,
        TextArrangement: #TextOnly
    };
    engine @Common.ValueList: {
        CollectionPath: 'Engines',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: engine_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: engine_name,
                ValueListProperty: 'name'
            }
        ]
    };

    engine @Common: {
        SemanticObject       : 'DWBBOEngine',
        SemanticObjectMapping: [{
            LocalProperty         : engine_id,
            SemanticObjectProperty: 'id'
        }]
    };

    transmission @Common: {
        Text           : transmission.name,
        TextArrangement: #TextOnly
    };
    transmission @Common.ValueList: {
        CollectionPath: 'Transmissions',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: transmission_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: transmission_name,
                ValueListProperty: 'name'
            }
        ]
    };

    transmission @Common: {
        SemanticObject       : 'DWBBOTransmission',
        SemanticObjectMapping: [{
            LocalProperty         : transmission_id,
            SemanticObjectProperty: 'id'
        }]
    };
};

annotate service.Models with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : modifiedAt,
            AllowedExpressions: 'SingleRange',
        },
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
