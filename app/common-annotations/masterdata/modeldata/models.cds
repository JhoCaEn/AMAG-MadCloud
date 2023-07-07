using {retail.dwb as db} from '../../../../db';

annotate db.Models with {
    id           @title: '{i18n>General.ID}';
    name         @title: '{i18n>General.name}';
    brand        @title: '{i18n>Brand}';
    year         @title: '{i18n>Models.year}';
    salesType    @title: '{i18n>SalesType}';
    engine       @title: '{i18n>Engine}';
    transmission @title: '{i18n>Transmission}';
    code         @title: '{i18n>General.code}';
    modifiedAt @title : '{i18n>replicated.modifiedAt}';
};

annotate db.Models with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Model}',
    TypeNamePlural: '{i18n>Models}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
