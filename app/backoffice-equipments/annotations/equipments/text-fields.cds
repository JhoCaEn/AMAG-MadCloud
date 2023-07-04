using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Equipments.texts {
    id          @UI.Hidden;
    locale      @title : '{i18n>Language}';
    locale      @Common: {
        Text           : language.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
    name        @title : '{i18n>General.name}';
    displayName @title : '{i18n>General.displayName}';
};
