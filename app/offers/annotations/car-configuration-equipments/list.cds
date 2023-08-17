using AppOffersService as service from '../../../../srv';

annotate service.CarConfigurationEquipments with @UI: {
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
