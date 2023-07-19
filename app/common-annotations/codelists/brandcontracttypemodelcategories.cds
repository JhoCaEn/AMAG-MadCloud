using {retail.dwb as db} from '../../../db';

annotate db.BrandContractTypeModelCategories with {
    brandContractType @title: '{i18n>BrandContractType}';
    modelCategory     @title: '{i18n>ModelCategory}';
};


annotate db.BrandContractTypeModelCategories with @Common.SemanticKey: [
    brandContractType_brand_code,
    brandContractType_code,
    modelCategory_code
];

annotate db.BrandContractTypeModelCategories with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>BrandContractTypeModelCategory}',
    TypeNamePlural: '{i18n>BrandContractTypeModelCategories}',
    Title         : {
        $Type: 'UI.DataField',
        Value: modelCategory_code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: modelCategory.name
    }
}};
