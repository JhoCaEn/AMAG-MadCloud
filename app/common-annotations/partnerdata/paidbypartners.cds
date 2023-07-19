using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrandPaidByPartners with {
    brand      @title: '{i18n>PartnerBrand}';
    partner    @title: '{i18n>Partner}';
    validFrom  @title: '{i18n>General.validFrom}';
    validTo    @title: '{i18n>General.validTo}';
    isDefault  @title: '{i18n>PartnerRoles.isDefault}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.PartnerBrandPaidByPartners with @Common.SemanticKey: [
    brand_partner_id,
    brand_brand_code,
    brand_validFrom,
    partner_id,
    validFrom
];

annotate db.PartnerBrandPaidByPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrandPaidByPartner}',
    TypeNamePlural: '{i18n>PartnerBrandPaidByPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: partner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: partner.name
    }
}};