using {retail.dwb as db} from '../../../db';

annotate db.OrderControls with {
    vehicleUsage           @title: '{i18n>VehicleUsage}';
    customerState          @title: '{i18n>CustomerState}';
    endCustomerState       @title: '{i18n>EndCustomerState}';
    soldToSource           @title: '{i18n>OrderControls.soldToSource}';
    soldToPartner          @title: '{i18n>SoldToPartner}';
    shipToSource           @title: '{i18n>OrderControls.shipToSource}';
    shipToPartner          @title: '{i18n>ShipToPartner}';
    billToSource           @title: '{i18n>OrderControls.billToSource}';
    billToPartner          @title: '{i18n>BillToPartner}';
    paidBySource           @title: '{i18n>OrderControls.paidBySource}';
    paidByPartner          @title: '{i18n>PaidByPartner}';
    releasedForPartner     @title: '{i18n>OrderControls.releasedForPartner}';
    releasedForFreePartner @title: '{i18n>OrderControls.releasedForFreePartner}';
    releasedForAMAGPartner @title: '{i18n>OrderControls.releasedForAMAGPartner}';
    forEmployee            @title: '{i18n>OrderControls.forEmployee}';
    availability           @title: '{i18n>VehicleAvailability}';
    orderType              @title: '{i18n>OrderType}';
    deliveryCode           @title: '{i18n>DeliveryCode}';
    createdAt              @title: '{i18n>replicated.createdAt}';
    modifiedAt             @title: '{i18n>replicated.modifiedAt}';
};

annotate db.OrderControls with @Common.SemanticKey: [
    vehicleUsage_code,
    customerState_code,
    endCustomerState_code
];

annotate db.OrderControls with @UI: {
    HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>OrderControl}',
        TypeNamePlural: '{i18n>OrderControls}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#HeaderTitle',
        }
    },

    ConnectedFields #HeaderTitle: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{vehicleUsage_code} / {customerState_code} / {endCustomerState_code}',
        Data    : {
            $Type                : 'Core.Dictionary',
            vehicleUsage_code    : {
                $Type: 'UI.DataField',
                Value: vehicleUsage_code,
            },
            customerState_code   : {
                $Type: 'UI.DataField',
                Value: customerState_code,
            },
            endCustomerState_code: {
                $Type: 'UI.DataField',
                Value: endCustomerState_code,
            }
        }
    }
};
