using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-equipment-package-content/list';
using from '../model-equipment-restrictions/list';
using from '../model-equipment-sales-prices/list';

annotate service.ModelStandardEquipments with @UI: {

    Facets                : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'VisibilityFacet',
            Label : '{i18n>BackofficeModels.FieldGroup.Visibility}',
            Target: '@UI.FieldGroup#Visibility'
        },
        {
            $Type        : 'UI.ReferenceFacet',
            ID           : 'PackageContentFacet',
            Label        : '{i18n>EquipmentPackageContent}',
            Target       : 'packageContent/@UI.PresentationVariant',
            ![@UI.Hidden]: {$edmJson: {$Eq: [
                {$Path: 'isPackage'},
                false
            ]}},
        },
    ],

    FieldGroup #General   : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: isPackage,
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
            }
        ]
    },

    FieldGroup #Visibility: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeModels.FieldGroup.Visibility}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: isVisible,
            },
            {
                $Type: 'UI.DataField',
                Value: isVisibleInConfigurator,
            },
            {
                $Type: 'UI.DataField',
                Value: isVisibleInSellingSystem,
            }
        ]
    }
};

annotate service.ModelExtraEquipments with @UI: {

    Facets                : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralFacet',
            Label : '{i18n>General.FieldGroup.General}',
            Target: '@UI.FieldGroup#General'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'VisibilityFacet',
            Label : '{i18n>BackofficeModels.FieldGroup.Visibility}',
            Target: '@UI.FieldGroup#Visibility'
        },
        {
            $Type        : 'UI.ReferenceFacet',
            ID           : 'PackageContentFacet',
            Label        : '{i18n>EquipmentPackageContent}',
            Target       : 'packageContent/@UI.PresentationVariant',
            ![@UI.Hidden]: {$edmJson: {$Eq: [
                {$Path: 'isPackage'},
                false
            ]}},
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

    FieldGroup #General   : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: isPackage,
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
            }
        ]
    },

    FieldGroup #Visibility: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeModels.FieldGroup.Visibility}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: isVisible,
            },
            {
                $Type: 'UI.DataField',
                Value: isVisibleInConfigurator,
            },
            {
                $Type: 'UI.DataField',
                Value: isVisibleInSellingSystem,
            }
        ]
    }
};
