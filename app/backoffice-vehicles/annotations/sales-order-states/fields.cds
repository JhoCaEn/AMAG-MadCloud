using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.SalesOrderStates with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
