using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-color-restrictions';

annotate service.ModelColorCombinations with @UI: {

    Facets             : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSection',
            Label : '{i18n>General.FieldGroup.General}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'GeneralSubSection',
                Label : '{i18n>General.FieldGroup.General}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'GeneralFacet',
                    Target: '@UI.FieldGroup#General'
                }]
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'RestrictionsSection',
            Label : '{i18n>Restrictions}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'RestrictionsFacet',
                Target: 'restrictions/@UI.PresentationVariant'
            }]
        }
    ],

    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: validFrom,
            },
            {
                $Type: 'UI.DataField',
                Value: validTo,
            },
            {
                $Type: 'UI.DataField',
                Value: orderableFrom,
            },
            {
                $Type: 'UI.DataField',
                Value: orderableTo,
            }
        ]
    },

};
