using AppBackofficeTransmissionsService as service from '../../../../srv';

annotate service.Transmissions with {
    driveType   @UI.Hidden;
    driveTypeId @title           : '{i18n>DriveType}';
    driveTypeId @Common          : {
        Text           : driveType.name,
        TextArrangement: #TextOnly
    };
    driveTypeId @Common.ValueList: {
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

    train @title           : '{i18n>DriveTrain}';
    train @Common          : {
        Text           : train.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    type        @UI.Hidden;
    typeId      @title           : '{i18n>BackofficeTransmissions.TransmissionType}';

    typeId      @Common          : {
        Text           : type.name,
        TextArrangement: #TextOnly
    };

    typeId      @Common.ValueList: {
        CollectionPath: 'Types',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: typeId,
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

    brand       @title           : '{i18n>Brand}';
    brand       @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    shift @title           : '{i18n>BackofficeTransmissions.TransmissionShift}';
    shift @Common          : {
        Text           : shift.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

};


annotate service.Transmissions with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : modifiedAt,
            AllowedExpressions: 'SingleRange',
        },

    ]
}};
