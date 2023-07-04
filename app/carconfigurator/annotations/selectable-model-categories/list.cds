using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModelCategories with @UI: {LineItem: [
    {Value: code},
    {Value: name}
], };
