using AppBackofficeModelsService as service from '../../../../srv';

annotate service.TransmissionShifts with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
