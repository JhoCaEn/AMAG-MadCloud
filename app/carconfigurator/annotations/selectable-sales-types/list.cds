using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableSalesTypes with @UI: {LineItem: [
    {Value: id},
    {Value: name}
], };
