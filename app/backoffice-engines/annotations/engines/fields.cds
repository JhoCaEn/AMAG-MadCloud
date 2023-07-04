using AppBackofficeEnginesService as service from '../../../../srv';

annotate service.Engines with {
    fuelType   @UI.Hidden;
    fuelTypeId @title           : '{i18n>FuelType}';
    fuelTypeId @Common          : {
        Text           : fuelType.name,
        TextArrangement: #TextOnly
    };
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

    brand      @title           : '{i18n>Brand}';
    brand      @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    capacity @Measures.Unit : 'cm³';
};


annotate service.Engines with @Capabilities: {FilterRestrictions: {
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
