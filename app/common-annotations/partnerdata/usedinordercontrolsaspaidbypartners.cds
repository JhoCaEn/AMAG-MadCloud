using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInOrderControlsAsPaidByPartners with @Common.SemanticKey: [
    paidByPartner_id,
    vehicleUsage_code,
    customerState_code,
    endCustomerState_code
];

annotate db.PartnerUsedInOrderControlsAsPaidByPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInOrderControlsAsPaidByPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInOrderControlsAsPaidByPartner}',
    Title         : {
        $Type: 'UI.DataField',
        Value: paidByPartner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: paidByPartner.name
    }
}};