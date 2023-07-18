using AppBackofficeBrandsService as service from '../../../../srv';
using from './text-list';
using from '../sales-types/list';

annotate service.ModelSeries with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeBrandsService.synchroniseModelSeries'
}];

annotate service.ModelSeries with @UI: {

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
            ID    : 'SalesTypesSection',
            Label : '{i18n>SalesTypes}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'SalesTypesSubSection',
                Label : '{i18n>SalesTypes}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'SalesTypesFacet',
                    Target: 'salesTypes/@UI.PresentationVariant#ModelSeries'
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
