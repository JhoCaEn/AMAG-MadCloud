using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModels with @UI: {
    LineItem           : [
        {Value: id},
        {Value: selected},
        {Value: name},
        {Value: year},
        {Value: code},
        {Value: isNetSalesPrices},
        {Value: category_code},
        {Value: salesType_id},
        {Value: engine_id},
        {Value: transmission_id},
        {Value: bodyType_id},
    ]
};
