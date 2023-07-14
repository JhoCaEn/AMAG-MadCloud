using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Models with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeModelsService.synchroniseModels'
}];

annotate service.Models with @UI: {
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
            ID    : 'SalesPricesSection',
            Label : '{i18n>BackofficeModels.FieldGroup.SalesPrices}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'SalesPricesSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.SalesPrices}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'SalesPricesFacet',
                    Target: 'salesPrices/@UI.PresentationVariant'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ModelRestrictionsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Restrictions}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ModelRestrictionsSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.Restrictions}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ModelRestrictionsFacet',
                    Target: 'restrictions/@UI.PresentationVariant'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ColorsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Colors}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ColorsSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.Colors}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ColorsFacet',
                    Target: 'colors/@UI.PresentationVariant'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ColorCombinationSection',
            Label : '{i18n>BackofficeModels.FieldGroup.ColorCombinations}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ColorCombinationSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.ColorCombinations}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ColorCombinationFacet',
                    Target: 'colorCombinations/@UI.PresentationVariant'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'EquipmentsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Equipments}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'EquipmentsSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.Equipments}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'EquipmentsFacet',
                    Target: 'equipments/@UI.PresentationVariant'
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
                Value: code
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: year,
            },
            {
                $Type: 'UI.DataField',
                Value: technicalKey,
            },
            {
                $Type: 'UI.DataField',
                Value: releasedForPartner,
            },
            {
                $Type: 'UI.DataField',
                Value: releasedForImporteur,
            },
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
            },
            {
                $Type: 'UI.DataField',
                Value: isNetSalesPrices,
            },
            {
                $Type: 'UI.DataField',
                Value: isOEMBuildableCheckActive,
            },
            {
                $Type: 'UI.DataField',
                Value: category_code,
            },
            {
                $Type: 'UI.DataField',
                Value: bodyTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: salesTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: modelSeriesId,
            },
            {
                $Type         : 'UI.DataFieldWithIntentBasedNavigation',
                Value         : transmission_id,
                Label         : '{i18n>Transmission}',
                SemanticObject: 'DWBBOTransmission',
                Action        : 'manage',
                Mapping       : [{
                    $Type                 : 'Common.SemanticObjectMappingType',
                    LocalProperty         : transmission_id,
                    SemanticObjectProperty: 'id',
                }, ]
            },
            {
                $Type         : 'UI.DataFieldWithIntentBasedNavigation',
                Value         : engine_id,
                Label         : '{i18n>Engine}',
                SemanticObject: 'DWBBOEngine',
                Action        : 'manage',
                Mapping       : [{
                    $Type                 : 'Common.SemanticObjectMappingType',
                    LocalProperty         : engine_id,
                    SemanticObjectProperty: 'id',
                }]
            }
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
