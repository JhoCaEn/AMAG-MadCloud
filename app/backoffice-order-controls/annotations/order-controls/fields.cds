using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.OrderControls with {
    vehicleUsage     @title           : '{i18n>VehicleUsage}';
    vehicleUsage     @Common          : {
        Text           : vehicleUsage.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    customerState    @title           : '{i18n>CustomerState}';
    customerState    @Common          : {
        Text           : customerState.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    endCustomerState @title           : '{i18n>EndCustomerState}';
    endCustomerState @Common          : {
        Text           : endCustomerState.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    soldToSource     @title           : '{i18n>OrderControls.soldToSource}';
    soldToSource     @Common          : {
        Text           : soldToSource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    shipToSource     @title           : '{i18n>OrderControls.shipToSource}';
    shipToSource     @Common          : {
        Text           : shipToSource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    billToSource     @title           : '{i18n>OrderControls.billToSource}';
    billToSource     @Common          : {
        Text           : billToSource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    paidBySource     @title           : '{i18n>OrderControls.paidBySource}';
    paidBySource     @Common          : {
        Text           : paidBySource.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    availability     @title           : '{i18n>VehicleAvailability}';
    availability     @Common          : {
        Text           : availability.name,
        TextArrangement: #TextOnly,
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
        Text           : soldToPartner.name,
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
