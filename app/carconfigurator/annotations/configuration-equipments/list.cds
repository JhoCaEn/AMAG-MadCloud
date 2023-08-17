using AppCarConfiguratorService as service from '../../../../srv';

annotate service.ConfigurationEquipments with @UI: {
    LineItem #NotDraft: [
        {Value: equipment_id},
        {Value: salesPriceConstraintColor_id},
        {Value: salesPriceConstraintEquipment_id},
        {Value: salesPrice.value}
    ],
    LineItem #Draft      : [
        {Value: equipment_id},
        {Value: salesPriceConstraintColor_id},
        {Value: salesPriceConstraintEquipment_id},
        {Value: salesPriceValue}
    ]
};
