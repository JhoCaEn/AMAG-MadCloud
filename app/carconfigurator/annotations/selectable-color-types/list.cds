using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableColorTypes with @UI: {LineItem: [
    {Value: code},
    {Value: name},
    {Value: color_id},
    {Value: selected}
], };
