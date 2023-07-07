module.exports = class AppBackofficeModelsService extends cds.ApplicationService {
    async init() {

        const replicationModelService = await cds.connect.to('ReplicationMasterdataModelService')

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => replicationModelService.send('replicate', { id }))

        return super.init()
    }
}
