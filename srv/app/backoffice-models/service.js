module.exports = class AppBackofficeModelsService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataModelService')

            return replication.send('replicate', { id })
        })

        return super.init()
    }
}
