using AppSessionsService as service from '../../../srv';

annotate service.Sessions with {
    projectType  @Core.Immutable;
    projectType  @Common: {
        Text           : projectType.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    
    salesPartner @Common: {
        Text           : salesPartner.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    brand @Common: {
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
    id @UI.Hidden;
    id @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
}
