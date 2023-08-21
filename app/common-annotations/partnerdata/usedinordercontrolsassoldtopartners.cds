using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInOrderControlsAsSoldToPartners with @Common.SemanticKey: [
    soldToPartner_id,
    vehicleUsage_code,
    customerState_code,
    endCustomerState_code
];

annotate db.PartnerUsedInOrderControlsAsSoldToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInOrderControlsAsSoldToPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInOrderControlsAsSoldToPartners}',
    Title         : {
        $Type: 'UI.DataField',
        Value: soldToPartner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: soldToPartner.name
    }
}};