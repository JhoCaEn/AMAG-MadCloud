using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.DeliveryCodes with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
