using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.EquipmentCategories with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeBrandsService.synchroniseEquipmentCategory'
}];

annotate service.EquipmentCategories with @UI: {

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
            ID    : 'EquipmentsSection',
            Label : '{i18n>Equipments}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'EquipmentsSubSection',
                Label : '{i18n>Equipments}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'EquipmentsFacet',
                    Target: 'equipments/@UI.PresentationVariant'
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
