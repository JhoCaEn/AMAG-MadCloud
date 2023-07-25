using AppSessionsService as service from '../../../../srv';

annotate service.Brands with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
}
