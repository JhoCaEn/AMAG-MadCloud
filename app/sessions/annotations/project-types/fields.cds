using AppSessionsService as service from '../../../../srv';

annotate service.ProjectTypes with {
    code @UI.Hidden;
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
}
