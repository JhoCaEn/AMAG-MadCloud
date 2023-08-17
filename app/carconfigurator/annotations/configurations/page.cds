using AppCarConfiguratorService as service from '../../../../srv';

annotate service.Configurations with @UI: {
    /*HeaderFacets            : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'General',
        Target: '@UI.FieldGroup#General'
    }],
    */
    Facets                                       : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_Properties',
            Label : 'WiP: Properties',
            Target: '@UI.FieldGroup#WiP'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SalesPrices',
            Label : 'WiP: SalesPrices',
            Target: '@UI.FieldGroup#WiPSalesPrices'
        },        
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'WiP_SalesPriceConstraints',
            Label : 'WiP: Sales Price Constraints',
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
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_Equipments',
            Label : 'WiP: Equipments',
            Target: 'equipments/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_PreselectedProperties',
            Label : 'WiP: Preselected Properties',
            Target: '@UI.FieldGroup#WiPPreselected'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_PreselectedEquipments',
            Label : 'WiP: Preselected Equipments',
            Target: 'preselectedEquipments/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableModelCategories',
            Label : 'WiP: Selectable ModelCategories',
            Target: 'selectableModelCategories/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableSalesTypes',
            Label : 'WiP: Selectable SalesTypes',
            Target: 'selectableSalesTypes/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableModels',
            Label : 'WiP: Selectable Models',
            Target: 'selectableModels/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableModelRestrictions',
            Label : 'WiP: Selectable Model Restrictions',
            Target: 'selectableModelRestrictions/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableColorTypes',
            Label : 'WiP: Selectable ColorTypes',
            Target: 'selectableColorTypes/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableColorCombinations',
            Label : 'WiP: Selectable ColorCombinations',
            Target: 'selectableColorCombinations/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableColors',
            Label : 'WiP: Selectable Colors',
            Target: 'selectableColors/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableEquipmentChapters',
            Label : 'WiP: Selectable Equipment Chapters',
            Target: 'selectableEquipmentChapters/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableEquipmentCategories',
            Label : 'WiP: Selectable Equipment Categories',
            Target: 'selectableEquipmentCategories/@UI.LineItem'
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'WiP_SelectableEquipments',
            Label : 'WiP: Selectable Equipments',
            Target: 'selectableEquipments/@UI.LineItem'
        }

    /*{
        $Type : 'UI.CollectionFacet',
        ID    : 'Model',
        Label : '{i18n>model}',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'ModelGeneral',
                Label : '{i18n>general}',
                Target: '@UI.FieldGroup#ModelGeneral'
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Engine',
                Label : '{i18n>Engine}',
                Target: '@UI.FieldGroup#Engine'
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Transmission',
                Label : '{i18n>Transmission}',
                Target: '@UI.FieldGroup#Transmission'
            }
        ]
    },*/
    /*{
        $Type : 'UI.CollectionFacet',
        ID    : 'Colors',
        Label : '{i18n>colors}',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Exterior',
                Label : '{i18n>exteriorColor}',
                Target: '@UI.FieldGroup#Exterior'
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Interior',
                Label : '{i18n>interiorColor}',
                Target: '@UI.FieldGroup#Interior'
            },
            {
                $Type : 'UI.ReferenceFacet',
                ID    : 'Roof',
                Label : '{i18n>roofColor}',
                Target: '@UI.FieldGroup#Roof',

            }
        ]
    },*/
    ],
    /*
        FieldGroup #General     : {Data: [
            {Value: partner_id},
            {Value: brand_code}
        ]},

        FieldGroup #ModelGeneral: {Data: [
            {Value: model.code},
            {Value: model.year}
        ]},
        FieldGroup #Engine      : {Data: [{Value: model.engine_id}]},
        FieldGroup #Transmission: {Data: [{Value: model.transmission_id}]},
        FieldGroup #Exterior    : {Data: [{Value: exteriorColor_id}]},
        FieldGroup #Interior    : {Data: [{Value: interiorColor_id}]},
        FieldGroup #Roof        : {Data: [{Value: roofColor_id}]},
    */
    FieldGroup #WiP                              : {Data: [
        {Value: configuredAt},
        {Value: partner_id},
        {Value: brand_code},
        {Value: salesOrganisation},
        {Value: isNewConfiguration},
        {Value: isPrepared},
        {Value: model_id},
        {Value: hasSelectableExteriorColors},
        {Value: hasSelectableInteriorColors},
        {Value: hasSelectableRoofColors},
        {Value: exteriorColor_id},
        {Value: interiorColor_id},
        {Value: roofColor_id},
        {Value: hasValidColorCombination},
        {Value: callback_ID}
    ]},

    FieldGroup #WiPPreselected                   : {Data: [
        {Value: preselectedModel_id},
        {Value: preselectedExteriorColor_id},
        {Value: preselectedInteriorColor_id},
        {Value: preselectedRoofColor_id}
    ]},

    FieldGroup #salesPriceExteriorColorConstrains: {Data: [
        {Value: exteriorColorSalesPriceConstraintColor_id},
        {Value: exteriorColorSalesPriceConstraintEquipment_id}
        
    ]},

    FieldGroup #salesPriceInteriorColorConstrains: {Data: [
        {Value: interiorColorSalesPriceConstraintColor_id},
        {Value: interiorColorSalesPriceConstraintEquipment_id}
    ]},

    FieldGroup #salesPriceRoofColorConstrains    : {Data: [
        {Value: roofColorSalesPriceConstraintColor_id},
        {Value: roofColorSalesPriceConstraintEquipment_id}
    ]},

    FieldGroup#WiPSalesPrices : {
        Data: [
            {Value: modelSalesPrice.value, Label: '{i18n>Model}'},
            {Value: exteriorColorSalesPrice.value, Label: '{i18n>ExteriorColor}'},
            {Value: interiorColorSalesPrice.value, Label: '{i18n>InteriorColor}'},
            {Value: roofColorSalesPrice.value, Label: '{i18n>RoofColor}'}
        ]
    }
};

annotate service.Configurations with @UI.Identification: [
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppCarConfiguratorService.prepare',
        Label : 'WiP: prepare'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppCarConfiguratorService.selectModel',
        Label : 'WiP: selectModel'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppCarConfiguratorService.selectColor',
        Label : 'WiP: selectColor'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppCarConfiguratorService.unselectColor',
        Label : 'WiP: unselectColor'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppCarConfiguratorService.selectEquipment',
        Label : 'WiP: selectEquipment'
    },
    {
        $Type : 'UI.DataFieldForAction',
        Action: 'AppCarConfiguratorService.unselectEquipment',
        Label : 'WiP: unselectEquipment'
    }
];
