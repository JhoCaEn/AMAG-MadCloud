using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.TransmissionTypes with {
    brand @UI.Hidden;
    shift @title : '{i18n>TransmissionShift}';
    shift @Common: {
        Text           : shift.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
}