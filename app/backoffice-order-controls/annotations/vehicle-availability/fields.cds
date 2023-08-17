using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.VehicleAvailabilities with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
