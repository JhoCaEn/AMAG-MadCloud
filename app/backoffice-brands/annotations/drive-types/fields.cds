using AppBackofficeBrandsService as service from '../../../../srv';

annotate service.DriveTypes with {
    brand @UI.Hidden;
    train @title : '{i18n>DriveTrain}';
    train @Common: {
        Text           : train.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
}
