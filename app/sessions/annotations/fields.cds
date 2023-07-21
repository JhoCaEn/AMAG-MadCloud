using AppSessionsService as service from '../../../srv';

annotate service.Sessions with {
    projectType  @Core.Immutable;
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

    offer        @Common          : {
        SemanticObject       : 'DWBOffer',
        SemanticObjectMapping: [{
            LocalProperty         : offer_ID,
            SemanticObjectProperty: 'ID'
        }]
    };
}

annotate service.Brands with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
}

annotate service.ProjectTypes with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
}

annotate service.SalesPartners with {
    id @UI.Hidden;
    id @Common: {
        Text           : name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
};
