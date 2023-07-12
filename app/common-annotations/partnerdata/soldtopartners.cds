using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrandSoldToPartners with {
    brand            @title: '{i18n>Brand}';
    validFrom        @title: '{i18n>General.validFrom}';
    validTo          @title: '{i18n>General.validTo}';
    isDefault @title: '{i18n>PartnerBrandSoldToPartners.isDefault}';
};


annotate db.PartnerBrandSoldToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrandSoldToPartner}',
    TypeNamePlural: '{i18n>PartnerBrandSoldToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: brand_brand_code
    }
}};
