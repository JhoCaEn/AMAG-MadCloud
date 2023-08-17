using AppOffersService as service from '../../../../srv';

annotate service.Offers with {
    ID                            @UI.Hidden;
    salesPartner                  @Common.ValueListWithFixedValues: true;
    salesPartner                  @Common.ValueList               : {
        CollectionPath: 'SalesPartners',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: salesPartner_id,
            ValueListProperty: 'id'
        }]
    };
    brand                         @Common                         : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    carConfigurationModel         @Common                         : {
        Text           : carConfigurationModel.name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
};

annotate service.SalesPartners with {
    id @Common: {
        Text           : name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
};
