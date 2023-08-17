using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-color-restrictions';
using from '../model-color-combinations-sales-prices';

annotate service.ModelColorCombinations with @UI: {

    Facets             : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'SalesPricesFacet',
            Label : '{i18n>Prices}',
            Target: 'salesPrices/@UI.PresentationVariant'
        },        
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'RestrictionsFacet',
            Label : '{i18n>Restrictions}',
            Target: 'restrictions/@UI.PresentationVariant'
        },
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
