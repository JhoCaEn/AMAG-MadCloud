using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.DriveTypes.texts {
    brand  @UI.Hidden;
    id     @UI.Hidden;
    locale @title : '{i18n>Language}';
    locale @Common: {
        Text           : language.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    name   @title : '{i18n>General.name}'
};
