using AppSessionsService as service from '../../../../srv';

annotate service.Sessions with {
    projectType  @Common          : {
        Text           : projectType.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    salesPartner @Common          : {
        Text           : salesPartner.name,
        TextArrangement: #TextFirst
    };
    salesPartner @Common.ValueList: {
        CollectionPath: 'SalesPartners',
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

    brand        @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
}
