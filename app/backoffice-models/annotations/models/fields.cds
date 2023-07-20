using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Models with {
    brand              @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    bodyType           @UI.Hidden;
    bodyTypeId         @title           : '{i18n>BodyType}';
    bodyTypeId         @Common          : {
        Text           : bodyType.name,
        TextArrangement: #TextFirst
    };
    bodyTypeId         @Common.ValueList: {
        CollectionPath: 'BodyTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: bodyTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    salesType          @UI.Hidden;
    salesTypeId        @title           : '{i18n>SalesType}';
    salesTypeId        @Common          : {
        Text           : salesType.name,
        TextArrangement: #TextFirst
    };
    salesTypeId        @Common.ValueList: {
        CollectionPath: 'SalesTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: salesTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'material'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'salesOrganisation'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            },
        ]
    };
    
    salesTypeId             @Common          : {
        SemanticObject       : 'DWBBOBrand',
        SemanticObjectMapping: [{
            LocalProperty         : salesTypeId,
            SemanticObjectProperty: 'id'
        }]
    };

    engine             @Common          : {
        Text           : engine.name,
        TextArrangement: #TextFirst
    };
    engine             @Common.ValueList: {
        CollectionPath: 'Engines',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: engine_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: unit,
                ValueListProperty: 'unit'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
    engine             @Common          : {
        SemanticObject       : 'DWBBOEngine',
        SemanticObjectMapping: [{
            LocalProperty         : engine_id,
            SemanticObjectProperty: 'id'
        }]
    };

    transmission       @Common          : {
        Text           : transmission.name,
        TextArrangement: #TextFirst
    };
    transmission       @Common.ValueList: {
        CollectionPath: 'Transmissions',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: transmission_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    transmission       @Common          : {
        SemanticObject       : 'DWBBOTransmission',
        SemanticObjectMapping: [{
            LocalProperty         : transmission_id,
            SemanticObjectProperty: 'id'
        }]
    };

    category           @Common          : {
        Text           : category.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    driveTypeId        @title           : '{i18n>DriveType}';
    driveTypeId        @Common          : {
        Text           : driveType.name,
        TextArrangement: #TextOnly
    };
    driveTypeId        @Common.ValueList: {
        CollectionPath: 'DriveTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: driveTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: train_code,
                ValueListProperty: 'train_code'
            }
        ]
    };

    driveTypeTrain     @Common          : {
        Text           : driveTypeTrain.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    transmissionTypeId @title           : '{i18n>TransmissionType}';
    transmissionTypeId @Common          : {
        Text           : transmissionType.name,
        TextArrangement: #TextOnly
    };
    transmissionTypeId @Common.ValueList: {
        CollectionPath: 'TransmissionTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: transmissionTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: shift_code,
                ValueListProperty: 'shift_code'
            }
        ]
    };

    transmissionShift  @Common          : {
        Text           : transmissionShift.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    fuelTypeId         @title           : '{i18n>FuelType}';
    fuelTypeId         @Common          : {
        Text           : fuelType.name,
        TextArrangement: #TextOnly
    };

    engineCapacity     @Measures.Unit   : 'cm³';
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
