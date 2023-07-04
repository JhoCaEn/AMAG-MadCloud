module.exports = class ReplicationPartnerdataTestService extends cds.ApplicationService {
    async init() {

        const partner = await cds.connect.to('ReplicationPartnerdataPartnerService')

        const replicate = async (service, data) => service.send('replicate', data).then(() => 'done')

        this.on('testPartner', async ({ data }) => replicate(partner, data))
        this.on('testStaticPartner', async () => replicate(partner, { id: '698' }))

        return super.init()
    }
}