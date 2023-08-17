using AppOffersService as service from '../../../../srv';
using from '../selectable-brands/list';
using from '../car-configuration-equipments/list';

annotate service.Offers with @UI: {

    Facets                                       : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'WiP_Section',
            Label : 'WiP',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'WiP_PropertiesSection',
                    Label : 'WiP: Properties',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'WiP_Properties',
                        Target: '@UI.FieldGroup#WiP'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'WiP_SelectableBrandsSection',
                    Label : 'WiP: Selectable Brands',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'WiP_SelectableBrands',
                        Target: 'selectableBrands/@UI.LineItem'
                    }]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'WiP_CarConfigurationPropertiesSection',
                    Label : 'WiP: Car Configuration Properties',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'WiP_CarConfigurationProperties',
                        Target: '@UI.FieldGroup#WiP_CarConfiguration'
                    }]
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'WiP_CarConfigurationSalesPrices',
                    Label : 'WiP: CarConfiguration Sales Prices',
                    Target: '@UI.FieldGroup#WiPSalesPrices'
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'WiP_CarConfigurationSalesPriceConstraints',
                    Label : 'WiP: Car Configuration Sales Price Constraints',
                    Facets: [
                        {
                            $Type : 'UI.ReferenceFacet',
                            ID    : 'WiP_ExteriorColorSalesPriceConstraints',
                            Label : 'WiP: Exterior Color Sales Price Constraints',
                            Target: '@UI.FieldGroup#salesPriceExteriorColorConstrains'
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            ID    : 'WiP_InteriorColorSalesPriceConstraints',
                            Label : 'WiP: Interior Color Sales Price Constraints',
                            Target: '@UI.FieldGroup#salesPriceInteriorColorConstrains'
                        },
                        {
                            $Type : 'UI.ReferenceFacet',
                            ID    : 'WiP_RoofColorSalesPriceConstraints',
                            Label : 'WiP: Roof Color Sales Price Constraints',
                            Target: '@UI.FieldGroup#salesPriceRoofColorConstrains'
                        }
                    ]
                },
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'WiP_CarConfigurationEquipmentsSection',
                    Label : 'WiP: Car Configuration Equipments',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'WiP_CarConfigurationEquipments',
                        Target: 'carConfigurationEquipments/@UI.LineItem'
                    }]
                },
            ]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'GeneralSection',
            Label : '{i18n>Offers.FieldGroup.General}',
            Facets: [
                {
                    $Type : 'UI.CollectionFacet',
                    ID    : 'GeneralGeneralSection',
                    Label : '{i18n>Offers.FieldGroup.General_General}',
                    Facets: [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'GeneralGeneralFacet',
                        Target: '@UI.FieldGroup#General_General'
                    }]

                },
                {
                    $Type        : 'UI.CollectionFacet',
                    ID           : 'GeneralVehicleSection',
                    Label        : '{i18n>Offers.FieldGroup.General_Vehicle}',
                    ![@UI.Hidden]: {$edmJson: {$Eq: [
                        {$Path: 'hasSalesPartner'},
                        false
                    ]}},
                    Facets       : [{
                        $Type : 'UI.ReferenceFacet',
                        ID    : 'GeneralVehicleFacet',
                        Target: '@UI.FieldGroup#General_Vehicle'
                    }]
                },
            ]
        },
    ],

    FieldGroup #WiP                              : {Data: [
        {Value: ocd},
        {Value: customerProjectName},
        {Value: customerProjectNumber},
        {Value: fleetProjectNumber},
        {Value: fleetProjectCompanyNumber},
        {Value: createdBySalesSystem},
        {Value: brand_code},
        {Value: salesPartner_id},
        {Value: hasSalesPartner},
        {Value: callback_ID},
    ]},

    FieldGroup #WiP_CarConfiguration             : {Data: [
        {Value: carConfigurationID},
        {Value: carConfigurationIsValid},
        {Value: carConfigurationConfiguredAt},
        {Value: carConfigurationModel_id},
        {Value: carConfigurationExteriorColor_id},
        {Value: carConfigurationInteriorColor_id},
        {Value: carConfigurationRoofColor_id}
    ]},

    FieldGroup #salesPriceExteriorColorConstrains: {Data: [
        {Value: carConfigurationExteriorColorSalesPriceConstraintEquipment_id},
        {Value: carConfigurationExteriorColorSalesPriceConstraintColor_id},

    ]},

    FieldGroup #salesPriceInteriorColorConstrains: {Data: [
        {Value: carConfigurationInteriorColorSalesPriceConstraintEquipment_id},
        {Value: carConfigurationInteriorColorSalesPriceConstraintColor_id},
    ]},

    FieldGroup #salesPriceRoofColorConstrains    : {Data: [
        {Value: carConfigurationRoofColorSalesPriceConstraintEquipment_id},
        {Value: carConfigurationRoofColorSalesPriceConstraintColor_id},
    ]},

    FieldGroup #WiPSalesPrices                   : {Data: [
        {
            Value: carConfigurationModel.salesPrice.value,
            Label: '{i18n>Model}'
        },
        {
            Value: carConfigurationExteriorColorSalesPrice.value,
            Label: '{i18n>ExteriorColor}'
        },
        {
            Value: carConfigurationInteriorColorSalesPrice.value,
            Label: '{i18n>InteriorColor}'
        },
        {
            Value: carConfigurationRoofColorSalesPrice.value,
            Label: '{i18n>RoofColor}'
        }
    ]},

    FieldGroup #General_General                  : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>Offers.FieldGroup.General_General}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: salesPartner_id
            },
            {
                $Type: 'UI.DataField',
                Value: customerProjectName
            },
            {
                $Type: 'UI.DataField',
                Value: customerProjectNumber
            },
            {
                $Type: 'UI.DataField',
                Value: fleetProjectNumber
            },
            {
                $Type: 'UI.DataField',
                Value: fleetProjectCompanyNumber
            },
        ]
    },
    FieldGroup #General_Vehicle                  : {
        $Type: 'UI.FieldGroupType',
        Label: '{i18n>Offers.FieldGroup.General_Vehicle}',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: brand_code
            },
            {
                $Type: 'UI.DataField',
                Value: carConfigurationConfiguredAt
            }
        ]
    },
};

annotate service.Offers with @UI.Identification: [
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppOffersService.selectSalesPartner',
        Label : 'WiP: selectSalesPartner'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppOffersService.selectBrand',
        Label : 'WiP: selectBrand'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppOffersService.createCarConfiguration',
        Label : 'WiP: createCarConfiguration'
    },
    {
        $Type        : 'UI.DataFieldForAction',
        Label        : '{i18n>Offers.Actions.copy}',
        Action       : 'AppOffersService.copy',
        ![@UI.Hidden]: {$edmJson: {$Eq: [
            {$Path: 'IsActiveEntity'},
            false
        ]}}
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppOffersService.finishCarConfiguration',
        Label : 'WiP: finishCarConfiguration'
    }
];
