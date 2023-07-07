module.exports = class AppBackofficeColorsService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataColorService')

            return replication.send('replicate', { id })
        })

        return super.init()
    }
}
