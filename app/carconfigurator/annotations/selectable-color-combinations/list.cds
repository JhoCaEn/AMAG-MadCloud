using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableColorCombinations with @UI: {LineItem: [
    {Value: exterior_id},
    {Value: interior_id},
    {Value: roof_id}
], };