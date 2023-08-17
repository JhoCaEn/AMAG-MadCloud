using AppOrderReleasesService as service from '../../../../srv';

annotate service.OrderTypes with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
