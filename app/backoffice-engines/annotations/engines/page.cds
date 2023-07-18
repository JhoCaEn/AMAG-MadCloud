using AppBackofficeEnginesService as service from '../../../../srv';
using from './text-list';
using from '../models/list';

annotate service.Engines with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeEnginesService.synchronise'
}];

annotate service.Engines with @UI: {

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
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'GeneralSubSection',
                    Label : '{i18n>General.FieldGroup.General}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'GeneralFacet',
                        Target: '@UI.FieldGroup#General'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'TranslationsSubSection',
                    Label : '{i18n>General.FieldGroup.Translations}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'TranslationsFacet',
                        Target: 'texts/@UI.PresentationVariant'
                    }]
                },
            ],
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
            }],
        }
    ],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: brand_code,
            },
            {
                $Type: 'UI.DataField',
                Value: cylinders
            },
            {
                $Type: 'UI.DataField',
                Value: fuelTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: unit
            },
            {
                $Type: 'UI.DataField',
                Value: powerHP
            },
            {
                $Type: 'UI.DataField',
                Value: powerKW
            },
            {
                $Type: 'UI.DataField',
                Value: capacity
            },
        ]
    },

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

    FieldGroup #Header      : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Header}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
        ]
    },
};
