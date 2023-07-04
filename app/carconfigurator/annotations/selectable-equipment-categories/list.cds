using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableEquipmentCategories with @UI: {LineItem: [
    {Value: id},
    {Value: name},
    {Value: selected},
    {Value: equipment_id},
], };