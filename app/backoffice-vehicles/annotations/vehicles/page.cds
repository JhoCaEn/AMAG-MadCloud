using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.Vehicles with @UI.Identification: [{
    $Type : 'UI.DataFieldForAction',
    Label : '{i18n>General.Actions.synchronise}',
    Action: 'AppBackofficeVehiclesService.synchronise'
}];

annotate service.Vehicles with @UI: {
    HeaderFacets                  : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'SynchronisedFacet',
        Label : '{i18n>General.FieldGroup.Synchronised}',
        Target: '@UI.FieldGroup#Synchronised'
    }],

    Facets                        : [
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
                    ID    : 'PartnersSubSection',
                    Label : '{i18n>BackofficeVehicles.FieldGroup.Partners}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'PartnersFacet',
                        Target: '@UI.FieldGroup#Partners'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'SalesPriceSubSection',
                    Label : '{i18n>BackofficeVehicles.FieldGroup.SalesPrice}',
                    Facets: [
                        {
                            $Type : 'UI.ReferenceFacet',
                            ID    : 'SalesPriceExteriorFacet',
                            Target: '@UI.FieldGroup#SalesPriceExterior'
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            ID    : 'SalesPriceInteriorrFacet',
                            Target: '@UI.FieldGroup#SalesPriceInterior'
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            ID    : 'SalesPriceRoofFacet',
                            Target: '@UI.FieldGroup#SalesPriceRoof'
                        }
                    ]
                }
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'EquipmentsSection',
            Label : '{i18n>Equipments}',
            Facets: [{
                $Type : 'UI.CollectionFacet',
                ID    : 'EquipmentsSubSection',
                Label : '{i18n>Equipments}',
                Facets: [{
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'EquipmentsFacet',
                    Target: 'equipments/@UI.PresentationVariant'
                }]
            }]
        }
    ],

    FieldGroup #General           : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: salesOrganisation,
            },
            {
                $Type: 'UI.DataField',
                Value: distributionChannel
            },
            {
                $Type: 'UI.DataField',
                Value: organizationDivision,
            },
            {
                $Type: 'UI.DataField',
                Value: material
            },
            {
                $Type: 'UI.DataField',
                Value: plant
            },
            {
                $Type: 'UI.DataField',
                Value: brand_code
            },
            {
                $Type: 'UI.DataField',
                Value: salesTypeId
            },
            {
                $Type: 'UI.DataField',
                Value: model_id
            },
            {
                $Type: 'UI.DataField',
                Value: customerState_code
            },
            {
                $Type: 'UI.DataField',
                Value: endCustomerState_code
            },
            {
                $Type: 'UI.DataField',
                Value: availability_code
            }
        ]
    },

    FieldGroup #Partners          : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeVehicles.FieldGroup.Partners}',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: salesPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: dealerPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: soldToPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: shipToPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: billToPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: paidByPartner_id
            }
        ]
    },

    FieldGroup #SalesPriceExterior: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeVehicles.FieldGroup.ExteriorColor}',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: exteriorColor_id
            },
            {
                $Type: 'UI.DataField',
                Value: exteriorColorSalesPriceConstraintEquipment_id
            },
            {
                $Type: 'UI.DataField',
                Value: exteriorColorSalesPriceConstraintColor_id
            },
            {
                $Type: 'UI.DataField',
                Value: exteriorColorSalesPrice.value
            }
        ]
    },

    FieldGroup #SalesPriceInterior: {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeVehicles.FieldGroup.InteriorColor}',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: interiorColor_id
            },
            {
                $Type: 'UI.DataField',
                Value: interiorColorSalesPriceConstraintEquipment_id
            },
            {
                $Type: 'UI.DataField',
                Value: interiorColorSalesPriceConstraintColor_id
            },
            {
                $Type: 'UI.DataField',
                Value: interiorColorSalesPrice.value
            }
        ]
    },

    FieldGroup #SalesPriceRoof    : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>BackofficeVehicles.FieldGroup.RoofColor}',
        Data : [

            {
                $Type: 'UI.DataField',
                Value: roofColor_id
            },
            {
                $Type: 'UI.DataField',
                Value: roofColorSalesPriceConstraintEquipment_id
            },
            {
                $Type: 'UI.DataField',
                Value: roofColorSalesPriceConstraintColor_id
            },
            {
                $Type: 'UI.DataField',
                Value: roofColorSalesPrice.value
            }
        ]
    },

    FieldGroup #Synchronised      : {
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

    FieldGroup #Header            : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>General.FieldGroup.Header}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Value: erpID
            },
        ]
    },
};
