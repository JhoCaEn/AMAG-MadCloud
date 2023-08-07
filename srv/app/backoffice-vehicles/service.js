module.exports = class AppBackofficeVehiclesService extends cds.ApplicationService {
    async init() {
        //TO BE CHANGED with the actual replication service and call of the method

        // const replicationVehiclesService = await cds.connect.to('ReplicationVehiclesService')

        // this.on('synchronise', async ({ params: [{ ID } = {}] = [] } = {}) => replicationVehiclesService.send('replicate', { ID }))

        return super.init()
    }
}
