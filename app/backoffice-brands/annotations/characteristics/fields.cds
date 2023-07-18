using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.Characteristics with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    }
};
