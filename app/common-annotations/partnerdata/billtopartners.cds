using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrandBillToPartners with {
    brand            @title: '{i18n>Brand}';
    validFrom        @title: '{i18n>General.validFrom}';
    validTo          @title: '{i18n>General.validTo}';
    isDefault @title: '{i18n>PartnerBrandBillToPartners.isDefault}';
};


annotate db.PartnerBrandBillToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrandBillToPartner}',
    TypeNamePlural: '{i18n>PartnerBrandBillToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: brand_brand_code
    }
}};