using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.EndCustomerStates with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
