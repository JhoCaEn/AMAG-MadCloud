module.exports = class AppBackofficeModelsService extends cds.ApplicationService {
    async init() {

        this.on('synchroniseModels', async ({ params: [{ id } = {}] = [] } = {}) => {

            const replicationModelService = await cds.connect.to('ReplicationMasterdataModelService')
            
            replicationModelService.send('replicate', { id })
        })

        return super.init()
    }
}
