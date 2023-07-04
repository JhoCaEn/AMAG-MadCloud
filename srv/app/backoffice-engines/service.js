module.exports = class AppBackofficeEnginesService extends cds.ApplicationService {
    async init() {

        const replicationEngineService = await cds.connect.to('ReplicationMasterdataEngineService')

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => replicationEngineService.send('replicate', { id }))

        return super.init()
    }
}
