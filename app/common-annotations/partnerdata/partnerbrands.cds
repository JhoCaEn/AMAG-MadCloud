using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrands with {
    partner      @title: '{i18n>Partner}';
    brand        @title: '{i18n>Brand}';
    hasContracts @title: '{i18n>Partner.hasContracts}';
    validFrom    @title: '{i18n>General.validFrom}';
    validTo      @title: '{i18n>General.validTo}';
    createdAt    @title: '{i18n>replicated.createdAt}';
    modifiedAt   @title: '{i18n>replicated.modifiedAt}';
};

annotate db.PartnerBrands with @Common.SemanticKey: [
    partner_id,
    brand_code
];

annotate db.PartnerBrands with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrand}',
    TypeNamePlural: '{i18n>PartnerBrands}',
    Title         : {
        $Type: 'UI.DataField',
        Value: brand_code
    }
}};
