using AppOffersService as service from '../../../../srv';

annotate service.SelectableBrands with @UI: {LineItem: [
    {Value: code},
    {Value: name},
], };
