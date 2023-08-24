module.exports = (raw) => ({
    ID: raw?._Extension?.DWBKey || null,
    erpID: raw.VMSVehicleUUID,
    usage_code: raw.VMSVehicleUsageStatus || null,
    customerState_code: raw?._Extension?.CustomerStatus || null,
    endCustomerState_code: raw?._Extension?.EndCustomerStatus || null,
    availability_code: raw.VMSVehicleAvailabilityStatus || null,
    deliveryCode_code: raw?._Extension?.DeliveryCode || null
})