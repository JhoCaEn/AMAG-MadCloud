using AppBackofficeTransmissionsService as service from '../../../../srv';

annotate service.Shifts with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
