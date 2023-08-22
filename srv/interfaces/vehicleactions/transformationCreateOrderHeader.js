module.exports = (order) => {
    const template = {
        DWBKey: order.ID,
        Plant: '1000',
        SalesOrganization: order.model?.salesType?.salesOrganisation,
        DistributionChannel: order.brand?.distributionChannel,
        OrganizationDivision: order.brand?.organizationDivision,
        Dealer: order.salesPartner_id,
        SoldToParty: order.soldToPartner_id,
        ShipToParty: order.shipToPartner_id,
        BillToParty: order.billToPartner_id,
        Payer: order.paidByPartner_id,
        Brand: order.brand?.code,
        SalesType: order.model?.salesType?.id,
        Material: order.model?.salesType?.material,
        ModelYear: parseInt(order.model?.year) || null,
        ModelCode: order.model?.code,
        CommissionYear: cds.context.timestamp.getFullYear(),
        VehicleUsage: order.usage_code,
        CustomerStatus: order.customerState_code,
        EndCustomerStatus: order.endCustomerState_code,
        VehicleAvailability: order.availability_code,
        DeliveryCode: order.deliveryCode_code
    }

    Object.keys(template).forEach(key => {
        if (!template[key])
            delete template[key]
    })

    return template
}
