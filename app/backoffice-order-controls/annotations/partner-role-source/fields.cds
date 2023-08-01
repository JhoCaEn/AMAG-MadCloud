using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.PartnerRoleSources with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
};
