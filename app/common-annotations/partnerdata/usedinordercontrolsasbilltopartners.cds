using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInOrderControlsAsBillToPartners with @Common.SemanticKey: [
    billToPartner_id,
    vehicleUsage_code,
    customerState_code,
    endCustomerState_code
];

annotate db.PartnerUsedInOrderControlsAsBillToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInOrderControlsAsBillToPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInOrderControlsAsBillToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: billToPartner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: billToPartner.name
    }
}};