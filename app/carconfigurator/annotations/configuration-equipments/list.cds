using AppCarConfiguratorService as service from '../../../../srv';

annotate service.ConfigurationEquipments with @UI: {LineItem: [
    {Value: equipment_id},
    {Value: salesPriceConstraintColor_id},
    {Value: salesPriceConstraintEquipment_id},
    {Value: salesPrice.value}
], };
