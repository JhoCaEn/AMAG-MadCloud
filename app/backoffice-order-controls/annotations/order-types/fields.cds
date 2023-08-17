using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.OrderTypes with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};