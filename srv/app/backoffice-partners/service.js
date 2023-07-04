module.exports = class AppBackofficePartnersService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationPartnerdataPartnerService')

            return replication.send('replicate', { id })
        })

        return super.init()
    }
}
