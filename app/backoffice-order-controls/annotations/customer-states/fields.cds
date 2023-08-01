using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.CustomerStates with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
