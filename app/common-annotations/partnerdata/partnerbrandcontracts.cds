using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrandContracts with {
    brand @title: '{i18n>PartnerBrand';
    type  @title: '{i18n>BrandContractType}';
};

annotate db.PartnerBrandContracts with @Common.SemanticKey: [
    brand_partner_id,
    brand_brand_code,
    type_brand_code,
    type_code
];

annotate db.PartnerBrandContracts with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrandContract}',
    TypeNamePlural: '{i18n>PartnerBrandContracts}',
    Title         : {
        $Type: 'UI.DataField',
        Value: type_code
    }
}};