using AppBackofficeColorsService as service from '../../../../srv';

annotate service.ColorTypes with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
