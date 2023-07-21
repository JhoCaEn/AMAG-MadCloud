using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInShipToPartners with @Common.SemanticKey: [
    shipToPartner_id,
    partner_id,
    brand_code,
    validFrom
];

annotate db.PartnerUsedInShipToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInShipToPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInShipToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: partner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: partner.name
    }
}};