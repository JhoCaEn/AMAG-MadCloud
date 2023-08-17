using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.OrderControls with {
    vehicleUsage     @Common          : {
        Text           : vehicleUsage.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    customerState    @Common          : {
        Text           : customerState.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    endCustomerState @Common          : {
        Text           : endCustomerState.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    soldToSource     @Common          : {
        Text           : soldToSource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    shipToSource     @Common          : {
        Text           : shipToSource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    billToSource     @Common          : {
        Text           : billToSource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    paidBySource     @Common          : {
        Text           : paidBySource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    availability     @Common          : {
        Text           : availability.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };

    soldToPartner @Common          : {
        Text           : soldToPartner.name,
        TextArrangement: #TextFirst
    };
    soldToPartner    @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: soldToPartner_id,
                ValueListProperty: 'id'
            }
        ]
    };

    shipToPartner    @Common          : {
        Text           : shipToPartner.name,
        TextArrangement: #TextFirst
    };
    shipToPartner    @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: shipToPartner_id,
            ValueListProperty: 'id'
        }]
    };

    billToPartner    @Common          : {
        Text           : billToPartner.name,
        TextArrangement: #TextFirst
    };
    billToPartner    @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: billToPartner_id,
            ValueListProperty: 'id'
        }]
    };

    paidByPartner    @Common          : {
        Text           : paidByPartner.name,
        TextArrangement: #TextFirst
    };
    paidByPartner    @Common.ValueList: {
        CollectionPath: 'Partners',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: paidByPartner_id,
            ValueListProperty: 'id'
        }]
    };

    orderType     @Common          : {
        Text           : orderType.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    }; 

    deliveryCode     @Common          : {
        Text           : deliveryCode.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };        
};

annotate service.OrderControls with @UI: {
    HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>OrderControl}',
        TypeNamePlural: '{i18n>OrderControls}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#HeaderTitle',
        }
    },

    ConnectedFields #HeaderTitle: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{vehicleUsage_name} / {customerState_name} / {endCustomerState_name}',
        Data    : {
            $Type            : 'Core.Dictionary',
            vehicleUsage_name: {
                $Type: 'UI.DataField',
                Value: vehicleUsage.name,
            },            
            customerState_name: {
                $Type: 'UI.DataField',
                Value: customerState.name,
            },            
            endCustomerState_name: {
                $Type: 'UI.DataField',
                Value: endCustomerState.name,
            }
        }
    }
};

annotate service.OrderControls with @Capabilities: {FilterRestrictions: {
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
        },

    ]
}};
