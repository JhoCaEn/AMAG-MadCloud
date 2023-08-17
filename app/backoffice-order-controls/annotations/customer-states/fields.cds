using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.CustomerStates with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
