module.exports = class AppBackofficeOrderControlsService extends cds.ApplicationService {
    async init() {

        const replicationOrderControlsService = await cds.connect.to('ReplicationMasterdataOrderControlsService')

        this.on('synchronise', async ({ params: [{ vehicleUsage_code: vehicleUsage, customerState_code: customerState, endCustomerState_code: endCustomerState } = {}] = [] } = {}) => replicationOrderControlsService.send('replicate', { vehicleUsage, customerState, endCustomerState }))

        return super.init()
    }
}
