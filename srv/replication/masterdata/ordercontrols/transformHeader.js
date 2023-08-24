module.exports = (raw) => {
    const transform = {
        vehicleUsage_code: raw.VehicleUsage,
        customerState_code: raw.CustomerStatus,
        endCustomerState_code: raw.EndCustomerStatus,
        soldToPartner_id: transformPartnerId(raw.SoldToParty),
        shipToPartner_id: transformPartnerId(raw.ShipToParty),
        billToPartner_id: transformPartnerId(raw.BillToParty),
        paidByPartner_id: transformPartnerId(raw.PaidByParty),
        releasedForPartner: !raw.OnlyForImporter,
        releasedForFreePartner: raw.ForFreeDealer,
        releasedForAMAGPartner: raw.ForAMAGDealer,
        forEmployee: raw.ForEmployee,
        availability_code: raw.VehicleAvailability,
        deliveryCode_code: raw.DeliveryCode,
        orderType_code: raw.OrderType
    }

    transform.soldToSource_code = transformPartnerSource(transform.soldToPartner_id)
    transform.shipToSource_code = transformPartnerSource(transform.shipToPartner_id)
    transform.billToSource_code = transformPartnerSource(transform.billToPartner_id)
    transform.paidBySource_code = transformPartnerSource(transform.paidByPartner_id)

    return transform
}

const transformPartnerId = value => value && value?.match(/^\d*$/)?.length ? value : null
const transformPartnerSource = value => value ? 'ordercontrol' : 'partner'