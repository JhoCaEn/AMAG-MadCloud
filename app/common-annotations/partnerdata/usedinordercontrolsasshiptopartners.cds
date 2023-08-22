using {retail.dwb as db} from '../../../db';

annotate db.PartnerUsedInOrderControlsAsShipToPartners with @Common.SemanticKey: [
    shipToPartner_id,
    vehicleUsage_code,
    customerState_code,
    endCustomerState_code
];

annotate db.PartnerUsedInOrderControlsAsShipToPartners with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>PartnerUsedInOrderControlsAsShipToPartner}',
    TypeNamePlural: '{i18n>PartnerUsedInOrderControlsAsShipToPartner}',
    Title         : {
        $Type: 'UI.DataField',
        Value: shipToPartner_id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: shipToPartner.name
    }
}};