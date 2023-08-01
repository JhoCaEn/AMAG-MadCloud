using {retail.dwb as db} from '../../../db';

annotate db.PartnerRoleSources with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.PartnerRoleSources with @Common.SemanticKey: [code];

annotate db.PartnerRoleSources with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerRoleSource}',
    TypeNamePlural: '{i18n>PartnerRoleSources}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
