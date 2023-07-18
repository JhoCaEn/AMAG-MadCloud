using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipments with @UI: {

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
                }
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PackageSection',
            Label : '{i18n>BackofficeModels.FieldGroup.PackageContent}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PackageSubSection',
                Label : '{i18n>BackofficeModels.FieldGroup.PackageContent}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PackageFacet',
                    Target: 'packageContent/@UI.PresentationVariant'
                }]
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'RestrictionsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Restrictions}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'RestrictionsSection',
                Label : '{i18n>BackofficeModels.FieldGroup.Restrictions}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'RestrictionsFacet',
                    Target: 'restrictions/@UI.PresentationVariant'
                }]
            }]
        }
    ],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: equipmentCode,
            },
            {
                $Type: 'UI.DataField',
                Value: equipmentTechnicalKey,
            },
            {
                $Type: 'UI.DataField',
                Value: isStandard,
            },
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
    }
};
