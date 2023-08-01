using AppBackofficeOrderControlsService as service from '../../../../srv';

annotate service.Partners with {
    id    @title : '{i18n>Partner}';
    id    @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
