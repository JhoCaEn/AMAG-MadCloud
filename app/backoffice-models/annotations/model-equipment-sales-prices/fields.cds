using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentSalesPrices with {
    equipment             @UI.Hidden;
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
annotate service.ModelEquipmentSalesPrices with @Common.SemanticKey: [
    constraintEquipmentId,
    constraintColorId,
    validFrom
];
*/

annotate service.ModelEquipmentSalesPrices with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>SalesPrice}',
    TypeNamePlural: '{i18n>SalesPrices}',
}};
