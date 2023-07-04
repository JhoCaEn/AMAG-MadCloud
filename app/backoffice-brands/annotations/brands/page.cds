using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.Brands with @UI: {

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
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ModelSeriesSection',
            Label : '{i18n>ModelSeries}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'ModelSeriesSubSection',
                Label : '{i18n>ModelSeries}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'ModelSeriesFacet',
                    Target: 'modelSeries/@UI.PresentationVariant'
                }]
            }, ]
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
                    Target: 'salesTypes/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'BodyTypesSection',
            Label : '{i18n>BodyTypes}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'BodyTypesSubSection',
                Label : '{i18n>BodyTypes}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'BodyTypesFacet',
                    Target: 'bodyTypes/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'FuelTypesSection',
            Label : '{i18n>FuelTypes}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'FuelTypesSubSection',
                Label : '{i18n>FuelTypes}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'FuelTypesFacet',
                    Target: 'fuelTypes/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'DriveTypesSection',
            Label : '{i18n>DriveTypes}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'DriveTypesSubSection',
                Label : '{i18n>DriveTypes}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'DriveTypesFacet',
                    Target: 'driveTypes/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'TransmissionTypesSection',
            Label : '{i18n>TransmissionTypes}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'TransmissionTypesSubSection',
                Label : '{i18n>TransmissionTypes}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'TransmissionTypesFacet',
                    Target: 'transmissionTypes/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'EquipmentChaptersSection',
            Label : '{i18n>EquipmentChapters}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'EquipmentChaptersSubSection',
                Label : '{i18n>EquipmentChapters}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'EquipmentChaptersFacet',
                    Target: 'equipmentChapters/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'EquipmentCategoriesSection',
            Label : '{i18n>EquipmentCategories}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'EquipmentCategoriesSubSection',
                Label : '{i18n>EquipmentCategories}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'EquipmentCategoriesFacet',
                    Target: 'equipmentCategories/@UI.PresentationVariant'
                }]
            }, ]
        },
    ],

    FieldGroup #General: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: organizationDivision,
            },
            {
                $Type: 'UI.DataField',
                Value: distributionChannel,
            },
        ]
    },
};
