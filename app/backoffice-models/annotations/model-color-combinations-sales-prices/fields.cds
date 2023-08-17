using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorCombinationSalesPrices with {
    colorCombination      @UI.Hidden;

    type                  @Common          : {
        Text           : type.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    constraintEquipment   @UI.Hidden;
    constraintEquipmentId @title           : '{i18n>SalesPrice.constraintEquipment}';
    constraintEquipmentId @Common          : {
        Text           : constraintEquipment.displayName,
        TextArrangement: #TextFirst
    };
    constraintEquipmentId @Common.ValueList: {
        CollectionPath: 'Equipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: constraintEquipmentId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    };

    constraintColor       @UI.Hidden;
    constraintColorId     @title           : '{i18n>SalesPrice.constraintColor}';
    constraintColorId     @Common          : {
        Text           : constraintColor.displayName,
        TextArrangement: #TextFirst
    };
    constraintColorId     @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: constraintColorId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'displayName'
            }
        ]
    };
};
/*
annotate service.ModelColorCombinationSalesPrices with @Common.SemanticKey: [
    type_code,
    constraintEquipmentId,
    constraintColorId,
    validFrom
];
*/

annotate service.ModelColorCombinationSalesPrices with @UI: {
    HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>SalesPrice}',
        TypeNamePlural: '{i18n>SalesPrices}'
    },
};
