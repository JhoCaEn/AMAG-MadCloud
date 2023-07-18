using AppBackofficeModelsService as service from '../../../../srv';
using from './text-list';
using from '../model-sales-prices/list';
using from '../model-restrictions/list';
using from '../model-colors/list';
using from '../model-color-combinations/list';
using from '../model-equipments/list';

annotate service.Models with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeModelsService.synchronise'
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
            ID    : 'EngineSection',
            Label : '{i18n>Engine}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'EngineSubSection',
                Label : '{i18n>Engine}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'EngineFacet',
                    Target: '@UI.FieldGroup#Engine'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'TransmissionSection',
            Label : '{i18n>Transmission}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'TransmissionSubSection',
                Label : '{i18n>Transmission}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'TransmissionFacet',
                    Target: '@UI.FieldGroup#Transmission'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'SalesSection',
            Label : '{i18n>General.FieldGroup.Sales}',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'SalesSubSection',
                    Label : '{i18n>General.FieldGroup.General}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'SalesFacet',
                        Target: '@UI.FieldGroup#Sales'
                    }, ],
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'PricesSubSection',
                    Label : '{i18n>Prices}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'SalesPricesFacet',
                        Target: 'salesPrices/@UI.PresentationVariant'
                    }]
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ColorsSection',
            Label : '{i18n>Colors}',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'ExteriorColorsSubSection',
                    Label : '{i18n>ExteriorColors}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'ExteriorColorsFacet',
                        Target: 'exteriorColors/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'InteriorColorsSubSection',
                    Label : '{i18n>InteriorColors}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'InteriorColorsFacet',
                        Target: 'interiorColors/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'RoofColorsSubSection',
                    Label : '{i18n>RoofColors}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'RoofColorsFacet',
                        Target: 'roofColors/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'ColorCombinationSubSection',
                    Label : '{i18n>ColorCombinations}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'ColorCombinationFacet',
                        Target: 'colorCombinations/@UI.PresentationVariant'
                    }]
                }
            ],
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
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ModelRestrictionsSection',
            Label : '{i18n>Restrictions}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ModelRestrictionsSubSection',
                Label : '{i18n>Restrictions}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ModelRestrictionsFacet',
                    Target: 'restrictions/@UI.PresentationVariant'
                }]
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ControlSection',
            Label : '{i18n>General.FieldGroup.Control}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ControlSubSection',
                Label : '{i18n>General.FieldGroup.Control}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ControlFacet',
                    Target: '@UI.FieldGroup#Control'
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
                Value: year,
            },
            {
                $Type: 'UI.DataField',
                Value: code
            },
            {
                $Type: 'UI.DataField',
                Value: technicalKey,
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
                Value: releasedForImporteur,
            },
            {
                $Type: 'UI.DataField',
                Value: releasedForPartner,
            },
            {
                $Type: 'UI.DataField',
                Value: category_code,
            },
            {
                $Type: 'UI.DataField',
                Value: bodyTypeId,
            },
        ]
    },

    FieldGroup #Sales       : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Sales}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: salesTypeId,
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
                Value: material,
            },
            {
                $Type: 'UI.DataField',
                Value: salesOrganisation,
            },
        ]
    },

    FieldGroup #Transmission: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>Transmission}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: transmission_id,
            },
            {
                $Type: 'UI.DataField',
                Value: transmissionGears,
            },
            {
                $Type: 'UI.DataField',
                Value: transmissionTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: transmissionShift_code,
            },
            {
                $Type: 'UI.DataField',
                Value: driveTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: driveTypeTrain_code,
            },
        ]
    },

    FieldGroup #Engine      : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>Engine}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: engine_id,
            },
            {
                $Type: 'UI.DataField',
                Value: engineCapacity,
            },
            {
                $Type: 'UI.DataField',
                Value: enginePowerHP,
            },
            {
                $Type: 'UI.DataField',
                Value: enginePowerKW,
            },
            {
                $Type: 'UI.DataField',
                Value: engineCylinders,
            },
            {
                $Type: 'UI.DataField',
                Value: fuelTypeId,
            },
            {
                $Type: 'UI.DataField',
                Value: fuelTypeUnit,
            },
        ]
    },

    FieldGroup #Control     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Control}',
        Data : [{
            $Type: 'UI.DataField',
            Value: isOEMBuildableCheckActive,
        }, ]
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
