module.exports = class AppBackofficeEquipmentsService extends cds.ApplicationService {
    async init() {

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataEquipmentService')

            return replication.send('replicate', { id })
        })
        
        return super.init()
    }
}
