using {retail.dwb as db} from '../../../db';

annotate db.PartnerBrandShipToPartners with {
    brand            @title: '{i18n>Brand}';
    validFrom        @title: '{i18n>General.validFrom}';
    validTo          @title: '{i18n>General.validTo}';
    isDefault @title: '{i18n>PartnerBrandShipToPartners.isDefault}';
};


annotate db.PartnerBrandShipToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerBrandShipToPartner}',
    TypeNamePlural: '{i18n>PartnerBrandShipToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: brand_brand_code
    }
}};
