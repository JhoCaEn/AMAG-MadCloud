using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipments with @UI: {

    Facets             : [
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
            }],
        }
    ]
};
