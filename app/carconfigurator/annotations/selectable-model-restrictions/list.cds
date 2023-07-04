using from './list';

using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModelRestrictions with @UI: {LineItem: [
    {Value: model_id},
    {Value: id}
], };
