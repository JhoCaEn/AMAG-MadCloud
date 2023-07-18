using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Transmissions with {
    id          @title           : '{i18n>Transmission}';
    id          @Common          : {
        Text           : name,
        TextArrangement: #TextFirst
    };

    brand       @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    driveTypeId @title           : '{i18n>DriveType}';
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

    train       @Common          : {
        Text           : train.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    typeId      @title           : '{i18n>TransmissionType}';
    typeId      @Common.ValueList: {
        CollectionPath: 'TransmissionTypes',
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

    shift       @Common          : {
        Text           : shift.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
}
