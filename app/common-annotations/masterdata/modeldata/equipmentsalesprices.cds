using {retail.dwb as db} from '../../../../db';

annotate db.ModelEquipmentSalesPrices with {
    equipment           @title               : '{i18n>Equipment}';
    constraintEquipment @title               : '{i18n>SalesPrice.constraintEquipment}';
    constraintColor     @title               : '{i18n>SalesPrice.constraintColor}';
    validFrom           @title               : '{i18n>General.validFrom}';
    validTo             @title               : '{i18n>General.validTo}';
    value               @title               : '{i18n>SalesPrice.value}';
    value               @Measures.ISOCurrency: currency;
    currency            @UI.Hidden;    
    weighting           @title               : '{i18n>SalesPrice.weighting}';
    createdAt           @title               : '{i18n>replicated.createdAt}';
    modifiedAt          @title               : '{i18n>replicated.modifiedAt}';
    
};

annotate db.ModelEquipmentSalesPrices with @Common.SemanticKey: [
    equipment_model_id,
    equipment_equipment_id,
    constraintEquipment_id,
    constraintColor_id,
    validFrom
];


annotate db.ModelEquipmentSalesPrices with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelEquipmentSalesPrice}',
    TypeNamePlural: '{i18n>ModelEquipmentSalesPrices}',
    Title         : {
        $Type: 'UI.DataField',
        Value: equipment_equipment_id
    }
}};
