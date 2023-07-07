using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.BodyTypes with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeBrandsService.synchroniseBodyType'
}];

annotate service.BodyTypes with @UI: {

    HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SynchronisedFacet',
        Label : '{i18n>General.FieldGroup.Synchronised}',
        Target: '@UI.FieldGroup#Synchronised'
    }, ],

    Facets                  : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSection',
            Label : '{i18n>General.FieldGroup.General}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'TranslationsSubSection',
                Label : '{i18n>General.FieldGroup.Translations}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'TranslationsFacet',
                    Target: 'texts/@UI.PresentationVariant'
                }]
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ModelsSection',
            Label : '{i18n>Models}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ModelsSubSection',
                Label : '{i18n>Models}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ModelsFacet',
                    Target: 'models/@UI.PresentationVariant'
                }]
            }]
        }
    ],

    FieldGroup #Synchronised: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Synchronised}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: createdAt,
                Label: '{i18n>General.FieldGroup.Synchronised.createdAt}'
            },
            {
                $Type: 'UI.DataField',
                Value: modifiedAt,
                Label: '{i18n>General.FieldGroup.Synchronised.modifiedAt}'
            },
        ]
    },

};
