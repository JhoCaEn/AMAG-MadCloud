using AppSessionsService as service from '../../../srv';

annotate service.Sessions with {
    projectType  @Core.Immutable;
    projectType  @Common                         : {
        Text           : projectType.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    salesPartner @Common.ValueListWithFixedValues: true;
    salesPartner @Common.ValueList               : {
        CollectionPath: 'SalesPartners',
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: salesPartner_id,
            ValueListProperty: 'id'
        }]
    };

    brand        @Common                         : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
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
    id @Common: {
        Text           : name,
        TextArrangement: #TextFirst,
        ValueListWithFixedValues
    };
};
