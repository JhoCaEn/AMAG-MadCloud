using AppBackofficeModelsService as service from '../../../../srv';

annotate service.Colors with {
    brand @UI.Hidden;
    id    @title : '{i18n>Color}';
    id    @Common: {
        Text           : displayName,
        TextArrangement: #TextFirst
    };
    type  @Common: {
        Text           : type.name,
        TextArrangement: #TextOnly
    };
}
