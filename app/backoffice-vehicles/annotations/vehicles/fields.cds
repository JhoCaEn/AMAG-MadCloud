using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.Vehicles with {
    brand                                      @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    usage                                      @Common          : {
        Text           : usage.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    customerState                              @Common          : {
        Text           : customerState.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    endCustomerState                           @Common          : {
        Text           : endCustomerState.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    availability                               @Common          : {
        Text           : availability.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    salesPartner                               @Common          : {
        Text           : salesPartner.name,
        TextArrangement: #TextFirst
    };
    salesPartner                               @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: salesPartner_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    dealerPartner                              @Common          : {
        Text           : dealerPartner.name,
        TextArrangement: #TextFirst
    };
    dealerPartner                              @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: dealerPartner_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    soldToPartner                              @Common          : {
        Text           : soldToPartner.name,
        TextArrangement: #TextFirst
    };
    soldToPartner                              @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: soldToPartner_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    shipToPartner                              @Common          : {
        Text           : shipToPartner.name,
        TextArrangement: #TextFirst
    };
    shipToPartner                              @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: shipToPartner_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    billToPartner                              @Common          : {
        Text           : billToPartner.name,
        TextArrangement: #TextFirst
    };
    billToPartner                              @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: billToPartner_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    paidByPartner                              @Common          : {
        Text           : paidByPartner.name,
        TextArrangement: #TextFirst
    };
    paidByPartner                              @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: paidByPartner_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    salesType                                  @UI.Hidden;
    salesTypeId                                @title           : '{i18n>SalesType}';
    salesTypeId                                @Common          : {
        Text           : salesType.name,
        TextArrangement: #TextOnly
    };
    salesTypeId                                @Common.ValueList: {
        CollectionPath: 'SalesTypes',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: salesTypeId,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: brand_code,
                ValueListProperty: 'brand_code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    exteriorColor                              @Common          : {
        Text           : exteriorColor.name,
        TextArrangement: #TextOnly
    };
    exteriorColor                              @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: exteriorColor_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    interiorColor                              @Common          : {
        Text           : interiorColor.name,
        TextArrangement: #TextOnly
    };
    interiorColor                              @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: interiorColor_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    roofColor                                  @Common          : {
        Text           : roofColor.name,
        TextArrangement: #TextOnly
    };
    roofColor                                  @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: roofColor_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    exteriorColorSalesPriceConstraintColor     @Common          : {
        Text           : exteriorColorSalesPriceConstraintColor.name,
        TextArrangement: #TextOnly
    };
    exteriorColorSalesPriceConstraintColor     @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: exteriorColorSalesPriceConstraintColor_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    exteriorColorSalesPriceConstraintEquipment @Common          : {
        Text           : exteriorColorSalesPriceConstraintEquipment.name,
        TextArrangement: #TextOnly
    };
    exteriorColorSalesPriceConstraintEquipment @Common.ValueList: {
        CollectionPath: 'Equipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: exteriorColorSalesPriceConstraintEquipment_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    interiorColorSalesPriceConstraintColor     @Common          : {
        Text           : interiorColorSalesPriceConstraintColor.name,
        TextArrangement: #TextOnly
    };
    interiorColorSalesPriceConstraintColor     @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: interiorColorSalesPriceConstraintColor_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    interiorColorSalesPriceConstraintEquipment @Common          : {
        Text           : interiorColorSalesPriceConstraintEquipment.name,
        TextArrangement: #TextOnly
    };
    interiorColorSalesPriceConstraintEquipment @Common.ValueList: {
        CollectionPath: 'Equipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: interiorColorSalesPriceConstraintEquipment_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    roofColorSalesPriceConstraintColor         @Common          : {
        Text           : roofColorSalesPriceConstraintColor.name,
        TextArrangement: #TextOnly
    };
    roofColorSalesPriceConstraintColor         @Common.ValueList: {
        CollectionPath: 'Colors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: roofColorSalesPriceConstraintColor_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    roofColorSalesPriceConstraintEquipment     @Common          : {
        Text           : roofColorSalesPriceConstraintEquipment.name,
        TextArrangement: #TextOnly
    };
    roofColorSalesPriceConstraintEquipment     @Common.ValueList: {
        CollectionPath: 'Equipments',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: roofColorSalesPriceConstraintEquipment_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };

    model                                      @Common          : {
        Text           : model.name,
        TextArrangement: #TextOnly
    };
    model                                      @Common.ValueList: {
        CollectionPath: 'Models',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: model_id,
                ValueListProperty: 'id'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
};


annotate service.Vehicles with @Capabilities: {FilterRestrictions: {
    $Type                       : 'Capabilities.FilterRestrictionsType',
    FilterExpressionRestrictions: [
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : createdAt,
            AllowedExpressions: 'SingleRange',
        },
        {
            $Type             : 'Capabilities.FilterExpressionRestrictionType',
            Property          : modifiedAt,
            AllowedExpressions: 'SingleRange',
        }
    ]
}};
