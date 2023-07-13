using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColors with @UI: {

    Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        }
    ],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id,
            },
            {
                $Type: 'UI.DataField',
                Value: color.name
            },
        ]
    }
};
