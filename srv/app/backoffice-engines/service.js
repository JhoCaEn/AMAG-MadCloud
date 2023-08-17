module.exports = class AppBackofficeEnginesService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataEngineService')

            return replication.send('replicate', { id })
        })

        return super.init()
    }
}
