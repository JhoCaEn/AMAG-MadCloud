using AppBackofficePurchaseOrderStatesService as service from '../../../../srv';
using from '../purchase-order-state-transformations/list';
using from './text-list';

annotate service.PurchaseOrderStates with @UI: {
    Facets             : [
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
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'TransformationsSection',
            Label : '{i18n>PurchaseOrderStates.Transformations}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'TransformationsSubSection',
                Label : '{i18n>PurchaseOrderStates.Transformations}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'TransformationsFacet',
                    Target: 'transformations/@UI.PresentationVariant'
                }]
            }]
        },
    ],


    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: code,
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: orderCreated,
            },
            {
                $Type: 'UI.DataField',
                Value: orderReleased,
            }
        ]
    },

};
