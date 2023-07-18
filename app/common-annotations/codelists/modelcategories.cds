using {retail.dwb as db} from '../../../db';

annotate db.ModelCategories with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>name}';
};

annotate db.ModelCategories with @Common.SemanticKey: [code];

annotate db.ModelCategories with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelCategory}',
    TypeNamePlural: '{i18n>ModelCategories}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
