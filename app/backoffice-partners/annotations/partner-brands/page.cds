using AppBackofficePartnersService as service from '../../../../srv';

annotate service.PartnerBrands with @UI: {

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
            }, ],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PartnerBrandContractsSection',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandContractsSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrandContracts}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandContractsFacet',
                    Target: 'contracts/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PartnerBrandSoldToPartnersSection',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandSoldToPartnersSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrandSoldToPartners}',                
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandSoldToPartnersFacet',
                    Target: 'soldToPartners/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PartnerBrandShipToPartnersSection',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandShipToPartnersSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrandShipToPartners}',                
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandShipToPartnersFacet',
                    Target: 'shipToPartners/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PartnerBrandBillToPartnersSection',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandBillToPartnersSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrandBillToPartners}',                
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandBillToPartnersFacet',
                    Target: 'billToPartners/@UI.PresentationVariant'
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
                Value: isRepresentative
            },
            {
                $Type: 'UI.DataField',
                Value: hasContracts
            },
            {
                $Type: 'UI.DataField',
                Value: validFrom
            },
            {
                $Type: 'UI.DataField',
                Value: validTo
            }
        ]
    }
};
