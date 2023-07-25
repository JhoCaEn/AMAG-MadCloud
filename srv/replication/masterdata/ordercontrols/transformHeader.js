module.exports = (raw) => ({
    vehicleUsage_code: raw.VehicleUsage,
    customerState_code: raw.CustomerStatus,
    endCustomerState_code: raw.EndCustomerStatus,
    soldToSource_code: transformSource(raw.SoldToParty),
    soldToPartner_id: transformPartner(raw.SoldToParty),
    shipToSource_code: transformSource(raw.ShipToParty),
    shipToPartner_id: transformPartner(raw.ShipToParty),
    billToSource_code: transformSource(raw.BillToParty),
    billToPartner_id: transformPartner(raw.BillToParty),
    paidBySource_code: transformSource(raw.PaidByParty),
    paidByPartner_id: transformPartner(raw.PaidByParty),
    releasedForPartner: !raw.OnlyForImporter,
    forEmployee: raw.ForEmployee,
    availability_code: raw.VehicleAvailability
})

const transformSource = (value) => { 
    const isNumber = parseInt(value)
    return isNaN(isNumber) ? 'ordercontrol' : 'partner' 
}
const transformPartner = (value) => { 
    const isNumber = parseInt(value)
    return isNaN(isNumber) ? null : isNumber  
}