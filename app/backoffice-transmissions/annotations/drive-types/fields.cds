using AppBackofficeTransmissionsService as service from '../../../../srv';

annotate service.DriveTypes with {
    id    @title : '{i18n>DriveType}';
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

    train @title : '{i18n>DriveTrain}';
    train @Common: {
        Text           : train.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};
