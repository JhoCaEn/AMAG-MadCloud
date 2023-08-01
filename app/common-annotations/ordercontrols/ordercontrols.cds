using {retail.dwb as db} from '../../../db';

annotate db.OrderControls with {
    vehicleUsage       @title: '{i18n>VehicleUsage}';
    customerState      @title: '{i18n>CustomerState}';
    endCustomerState   @title: '{i18n>EndCustomerState}';
    soldToSource       @title: '{i18n>OrderControls.soldToSource}';
    soldToPartner      @title: '{i18n>OrderControls.soldToPartner}';
    shipToSource       @title: '{i18n>OrderControls.shipToSource}';
    shipToPartner      @title: '{i18n>OrderControls.shipToPartner}';
    billToSource       @title: '{i18n>OrderControls.billToSource}';
    billToPartner      @title: '{i18n>OrderControls.billToPartner}';
    paidBySource       @title: '{i18n>OrderControls.paidBySource}';
    paidByPartner      @title: '{i18n>OrderControls.paidByPartner}';
    releasedForPartner @title: '{i18n>OrderControls.releasedForPartner}';
    forEmployee        @title: '{i18n>OrderControls.forEmployee}';
    availability       @title: '{i18n>VehicleAvailability}';
    createdAt          @title: '{i18n>replicated.createdAt}';
    modifiedAt         @title: '{i18n>replicated.modifiedAt}';
};

annotate db.OrderControls with @Common.SemanticKey: [
    vehicleUsage_code,
    customerState_code,
    endCustomerState_code
];

annotate db.OrderControls with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>OrderControl}',
    TypeNamePlural: '{i18n>OrderControls}',
    Title         : {
        $Type: 'UI.DataField',
        Value: headerTitle
    }
}};
