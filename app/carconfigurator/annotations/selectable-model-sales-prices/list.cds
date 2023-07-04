using from './list';

using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModelSalesPrices with @UI: {LineItem: [
    {Value: model_id},
    {Value: validFrom},
    {Value: validTo},
    {Value: value},
    {Value: currency}
], };
