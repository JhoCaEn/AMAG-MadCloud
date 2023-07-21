using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInSoldToPartners with @Common.SemanticKey: [
    soldToPartner_id,
    partner_id,
    brand_code,
    validFrom
];

annotate db.PartnerUsedInSoldToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInSoldToPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInSoldToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: partner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: partner.name
    }
}};