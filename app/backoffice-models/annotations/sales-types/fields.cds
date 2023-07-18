using AppBackofficeModelsService as service from '../../../../srv';

annotate service.SalesTypes with {
    id          @title           : '{i18n>SalesType}';
    id          @Common          : {
        Text           : name,
        TextArrangement: #TextFirst
    };

    brand       @Common          : {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };    
};