using {retail.dwb as db} from '../../../db';

annotate db.BrandContractTypes with {
    brand @title: '{i18n>Brand}';
    code  @title: '{i18n>General.code}';
    name  @title: '{i18n>General.name}';
};

annotate db.BrandContractTypes with @Common.SemanticKey: [brand_code, code];

annotate db.BrandContractTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BrandContractType}',
    TypeNamePlural: '{i18n>BrandContractTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};