using AppBackofficePurchaseOrderStatesService as service from '../../../../srv';
using from '../transformations/list';
using from './text-list';

annotate service.States with @UI: {
    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TranslationsFacet',
            Label : '{i18n>General.FieldGroup.Translations}',
            Target: 'texts/@UI.PresentationVariant'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TransformationsFacet',
            Label : '{i18n>PurchaseOrderStateTransformations}',
            Target: 'transformations/@UI.PresentationVariant'
        }
    ],

    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
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

    FieldGroup #Header            : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Header}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: code
            },
            {
                $Type: 'UI.DataField',
                Value: name
            },
        ]
    },
};
