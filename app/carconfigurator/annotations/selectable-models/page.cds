using AppCarConfiguratorService as service from '../../../../srv';

annotate service.SelectableModels with @UI: {
    HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'General',
        Target: '@UI.FieldGroup#General'
    }],
    Facets                  : [{
        $Type : 'UI.CollectionFacet',
        ID    : 'Configuration',
        Label : '{i18n>configuration}',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            ID    : 'ModelGeneral',
            Target: '@UI.FieldGroup#ModelGeneral'
        }]
    }],

    FieldGroup #General     : {Data: [
        {Value: model.name},
        {Value: model.brand.code}
    ]},

    FieldGroup #ModelGeneral: {Data: [
        {Value: model_id},
        {Value: model.salesType_id},
        {Value: model.engine_id},
        {Value: model.transmission_id}
    ]}
};
