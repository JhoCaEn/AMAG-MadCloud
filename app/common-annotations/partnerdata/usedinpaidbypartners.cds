using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInPaidByPartners with @Common.SemanticKey: [
    paidByPartner_id,
    partner_id,
    brand_code,
    validFrom
];

annotate db.PartnerUsedInPaidByPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInPaidByPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInPaidByPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: partner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: partner.name
    }
}};