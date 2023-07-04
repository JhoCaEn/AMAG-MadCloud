using {retail.dwb as db} from '../../../db';

annotate db.Colors with {
    /*id          @Common: {
        Text           : displayName,
        TextArrangement: #TextOnly
    };
    */
    code        @title : '{i18n>colorCode}';
    name        @title : '{i18n>colorName}';
    displayName @title : '{i18n>displayName}';
};
