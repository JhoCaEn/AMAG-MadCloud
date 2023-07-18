using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrandPaidByPartners with {
    brand            @title: '{i18n>Brand}';
    validFrom        @title: '{i18n>General.validFrom}';
    validTo          @title: '{i18n>General.validTo}';
    isDefault @title: '{i18n>PartnerBrandPaidByPartners.isDefault}';
};


annotate db.PartnerBrandPaidByPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrandPaidByPartner}',
    TypeNamePlural: '{i18n>PartnerBrandPaidByPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: brand_brand_code
    }
}};