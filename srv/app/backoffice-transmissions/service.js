module.exports = class AppBackofficeTransmissionsService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataTransmissionService')

            return replication.send('replicate', { id })
        })

        return super.init()
    }
}
