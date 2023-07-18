using AppBackofficeColorsService as service from '../../../../srv';

annotate service.Types with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
