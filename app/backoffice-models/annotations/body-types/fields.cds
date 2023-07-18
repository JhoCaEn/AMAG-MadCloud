using AppBackofficeModelsService as service from '../../../../srv';

annotate service.BodyTypes with {
    brand @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    id    @title : '{i18n>BodyType}';
    id    @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };
};
