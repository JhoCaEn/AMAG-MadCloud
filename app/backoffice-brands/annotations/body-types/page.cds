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

    Facets                  : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'TranslationsFacet',
        Label : '{i18n>General.FieldGroup.Translations}',
        Target: 'texts/@UI.PresentationVariant'
    }],

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
