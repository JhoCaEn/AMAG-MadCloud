using AppCarConfiguratorService as service from '../../../../srv';

annotate service.ConfigurationEquipments with @UI: {LineItem: [
    {Value: equipment_id},
], };
