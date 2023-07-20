using AppBackofficePartnersService as service from '../../../../srv';
using from '../partner-brands/list';

annotate service.Partners with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficePartnersService.synchronise'
}];

annotate service.Partners with @UI: {
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
            ID    : 'PartnerBrandsSection',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandsSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrands}',                
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandsFacet',
                    Target: 'brands/@UI.PresentationVariant'
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
                    Target: 'usedInSoldToPartners/@UI.PresentationVariant'
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
                    Target: 'usedInShipToPartners/@UI.PresentationVariant'
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
                    Target: 'usedInBillToPartners/@UI.PresentationVariant'
                }]
            }, ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PartnerBrandPaidByPartnersSection',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandPaidByPartnersSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrandPaidByPartners}',                
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandPaidByPartnersFacet',
                    Target: 'usedInPaidByPartners/@UI.PresentationVariant'
                }]
            }, ]
        },
    ],

    FieldGroup #General     : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: isSalesPartner
            },            
            {
                $Type: 'UI.DataField',
                Value: hasBrands
            },
            {
                $Type: 'UI.DataField',
                Value: hasContracts,
            },
            {
                $Type: 'UI.DataField',
                Value: validFrom,
            },
            {
                $Type: 'UI.DataField',
                Value: validTo,
            },
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
};
