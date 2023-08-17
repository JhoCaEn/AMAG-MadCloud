using AppBackofficeVehiclesService as service from '../../../../srv';

annotate service.PurchaseOrderStates with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
