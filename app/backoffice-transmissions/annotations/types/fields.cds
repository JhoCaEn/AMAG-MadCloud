using AppBackofficeTransmissionsService as service from '../../../../srv';

annotate service.Types with {
    id    @title : '{i18n>BackofficeTransmissions.TransmissionType}';
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

    shift @title : '{i18n>BackofficeTransmissions.TransmissionShift}';
    shift @Common: {
        Text           : shift.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};
