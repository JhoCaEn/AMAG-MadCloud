using AppBackofficePartnersService as service from '../../../../srv';
using from '../partner-brands/list';
using from '../partner-used-in-sold-to-partners/list';
using from '../partner-used-in-ship-to-partners/list';
using from '../partner-used-in-bill-to-partners/list';
using from '../partner-used-in-paid-by-partners/list';

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
            },{
                $Type : 'UI.CollectionFacet',
                ID    : 'PartnerBrandsSubSection',
                Label : '{i18n>BackofficePartners.PartnerBrands}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'PartnerBrandsFacet',
                    Target: 'brands/@UI.PresentationVariant'
                }]
            }, ],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'UsedInPartnerRolesSection',
            Label : '{i18n>BackofficePartners.UsedInPartnerRoles}',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'UsedInSoldToPartnersSubSection',
                    Label : '{i18n>PartnerUsedInSoldToPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'UsedInSoldToPartnersFacet',
                        Target: 'usedInSoldToPartners/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'UsedInShipToPartnersSubSection',
                    Label : '{i18n>PartnerUsedInShipToPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'UsedInShipToPartnersFacet',
                        Target: 'usedInShipToPartners/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'UsedInBillToPartnersSubSection',
                    Label : '{i18n>PartnerUsedInBillToPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'UsedInBillToPartnersFacet',
                        Target: 'usedInBillToPartners/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'UsedInPaidByPartnersSubSection',
                    Label : '{i18n>PartnerUsedInPaidByPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'UsedInPaidByPartnersFacet',
                        Target: 'usedInPaidByPartners/@UI.PresentationVariant'
                    }]
                }
            ]
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
