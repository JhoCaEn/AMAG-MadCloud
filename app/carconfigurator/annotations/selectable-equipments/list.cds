using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableEquipments with @UI: {LineItem: [
    {Value: id},
    {Value: selectable},
    {Value: selected},
    {Value: displayName},
    {Value: chapter_id},
    {Value: category_id},
], };