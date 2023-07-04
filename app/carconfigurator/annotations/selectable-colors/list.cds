using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableColors with @UI: {LineItem: [
    {Value: id},
    {Value: selectable},
    {Value: selected},
    {Value: displayName},
    {Value: type_code},
    {Value: type.name}
], };