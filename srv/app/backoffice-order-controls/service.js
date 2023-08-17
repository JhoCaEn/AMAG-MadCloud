module.exports = class AppBackofficeOrderControlsService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ vehicleUsage_code: vehicleUsage, customerState_code: customerState, endCustomerState_code: endCustomerState } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataOrderControlsService')

            return replication.send('replicate', { vehicleUsage, customerState, endCustomerState })
        })

        return super.init()
    }
}
