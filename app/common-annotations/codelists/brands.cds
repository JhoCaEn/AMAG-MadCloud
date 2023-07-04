using {retail.dwb as db} from '../../../db';

annotate db.Brands with {
    code                 @title: '{i18n>General.code}';
    name                 @title: '{i18n>General.name}';
    distributionChannel  @title: '{i18n>Brands.distributionChannel}';
    organizationDivision @title: '{i18n>Brands.organizationDivision}';
};

annotate db.Brands with @Common.SemanticKey: [code];

annotate db.Brands with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Brand}',
    TypeNamePlural: '{i18n>Brands}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
