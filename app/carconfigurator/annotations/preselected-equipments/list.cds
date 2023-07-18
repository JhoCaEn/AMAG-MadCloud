using AppCarConfiguratorService as service from '../../../../srv';

annotate service.PreselectedEquipments with @UI: {LineItem: [
    {Value: equipment_id},
    {Value: displayName}
], };