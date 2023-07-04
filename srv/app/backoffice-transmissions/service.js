module.exports = class AppBackofficeTransmissionsService extends cds.ApplicationService {
    async init() {

        const replication = await cds.connect.to('ReplicationMasterdataTransmissionService')

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => replication.send('replicate', { id }))

        return super.init()
    }
}
