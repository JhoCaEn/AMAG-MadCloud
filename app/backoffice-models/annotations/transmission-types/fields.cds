using AppBackofficeModelsService as service from '../../../../srv';

annotate service.TransmissionTypes with {
    id    @Common: {
        Text           : name,
        TextArrangement: #TextFirst
    };

    brand @title : '{i18n>Brand}';
    brand @Common: {
        Text           : brand.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };

    shift @Common: {
        Text           : shift.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};