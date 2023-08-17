module.exports = class AppBackofficeVehiclesService extends cds.ApplicationService {
    async init() {
        //TO BE CHANGED with the actual replication service and call of the method

        this.on('synchronise', async ({ params: [{ ID } = {}] = [] } = {}) => {
            // const replication = await cds.connect.to('ReplicationMasterdataVehiclesService')

            // return replication.send('replicate', { ID })
        })

        return super.init()
    }
}
