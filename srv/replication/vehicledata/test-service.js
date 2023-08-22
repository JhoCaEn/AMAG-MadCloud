module.exports = class ReplicationVehicledataVehicleTestService extends cds.ApplicationService {
    async init() {

        const vehicle = await cds.connect.to('ReplicationVehicledataVehicleService')

        const replicate = async (service, data) => service.send('replicate', data).then(() => 'done')

        this.on('testVehicle', async ({ data }) => replicate(vehicle, data))
        this.on('testStaticVehicles', async () => replicate(vehicle, { erpID: '55ab8eee-e83b-1edc-a4e6-b242330bb258' }))

        return super.init()
    }
}