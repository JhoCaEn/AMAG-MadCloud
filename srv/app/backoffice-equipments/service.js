module.exports = class AppBackofficeEquipmentsService extends cds.ApplicationService {
    async init() {
        const replicationEquipmentService = await cds.connect.to('ReplicationMasterdataEquipmentService')

        this.on('synchronise', async ({ params: [{ id } = {}] = [] } = {}) => replicationEquipmentService.send('replicate', { id }))
        
        return super.init()
    }
}
