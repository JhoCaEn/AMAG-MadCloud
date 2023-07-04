using {retail.dwb as db} from '../../../../db';

annotate db.Models with {
    /*id           @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
    */
    // id           @UI.Hidden;
    name         @title : '{i18n>name}';
    brand        @title : '{i18n>Brand}';
    year         @title : '{i18n>year}';
    salesType    @title : '{i18n>SalesType}';
    engine       @title : '{i18n>Engine}';
    transmission @title : '{i18n>Transmission}';
    code         @title : '{i18n>code}';
};