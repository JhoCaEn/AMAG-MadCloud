using AppBackofficeTransmissionsService as service from '../../../../srv';

annotate service.DriveTrains with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
