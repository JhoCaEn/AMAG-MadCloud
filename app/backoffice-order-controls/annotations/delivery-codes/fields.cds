using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.DeliveryCodes with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};