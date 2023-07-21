using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInBillToPartners with @Common.SemanticKey: [
    billToPartner_id,
    partner_id,
    brand_code,
    validFrom
];

annotate db.PartnerUsedInBillToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInBillToPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInBillToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: partner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: partner.name
    }
}};