using AppBackofficePartnersService as service from '../../../../srv';
using from '../partner-brand-contracts/list';
using from '../partner-brand-sold-to-partners/list';
using from '../partner-brand-ship-to-partners/list';
using from '../partner-brand-bill-to-partners/list';
using from '../partner-brand-paid-by-partners/list';

annotate service.PartnerBrands with @UI: {

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
                    ID    : 'PartnerBrandContractsSubSection',
                    Label : '{i18n>BackofficePartners.PartnerBrandContracts}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PartnerBrandContractsFacet',
                        Target: 'contracts/@UI.PresentationVariant'
                    }]
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'PartnerRolesSection',
            Label : '{i18n>PartnerRoles}',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'PartnerBrandSoldToPartnersSubSection',
                    Label : '{i18n>PartnerBrandSoldToPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PartnerBrandSoldToPartnersFacet',
                        Target: 'soldToPartners/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'PartnerBrandShipToPartnersSubSection',
                    Label : '{i18n>PartnerBrandShipToPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PartnerBrandShipToPartnersFacet',
                        Target: 'shipToPartners/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'PartnerBrandBillToPartnersSubSection',
                    Label : '{i18n>PartnerBrandBillToPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PartnerBrandBillToPartnersFacet',
                        Target: 'billToPartners/@UI.PresentationVariant'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'PartnerBrandPaidByPartnersSubSection',
                    Label : '{i18n>PartnerBrandPaidByPartners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PartnerBrandPaidByPartnersFacet',
                        Target: 'paidByPartners/@UI.PresentationVariant'
                    }]
                },
            ]
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
