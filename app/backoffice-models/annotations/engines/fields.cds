using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Engines with {
    id          @title           : '{i18n>Engine}';
    id          @Common          : {
        Text           : name,
        TextArrangement: #TextFirst
    };

    brand       @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    fuelTypeId @title           : '{i18n>FuelType}';
    fuelTypeId @Common.ValueList: {
        CollectionPath: 'FuelTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: fuelTypeId,
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
            }
        ]
    };            
};