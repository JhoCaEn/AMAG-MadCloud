using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModelRestrictionsRules with @UI: {LineItem: [
    {Value: id},
    {Value: categoryId},
    {Value: equipment_id},
    {Value: color_id},
    {Value: isRequired},
    {Value: isForbidden}
], };
