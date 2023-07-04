using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableEquipmentChapters with @UI: {LineItem: [
    {Value: id},
    {Value: name},
    {Value: characteristicName},
    {Value: isVisibleInConfigurator}
], };