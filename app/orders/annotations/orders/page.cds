using AppOrdersService as service from '../../../../srv';

using from '../vehicle-equipments/list';

annotate service.Orders with @UI: {
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
        }
    ],
    FieldGroup #WiP                              : {Data: [
        {Value: configuredAt},
        {Value: salesPartner_id},
        {Value: brand_code},
        {Value: model_id},
        {Value: exteriorColor_id},
        {Value: interiorColor_id},
        {Value: roofColor_id}
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
            {Value: exteriorColorSalesPrice.value, Label: '{i18n>ExteriorColor}'},
            {Value: interiorColorSalesPrice.value, Label: '{i18n>InteriorColor}'},
            {Value: roofColorSalesPrice.value, Label: '{i18n>RoofColor}'}
        ]
    }
};