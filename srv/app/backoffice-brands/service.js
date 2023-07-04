module.exports = class AppBackofficeBrandsService extends cds.ApplicationService {

    async init() {

        this.on('synchroniseModelSeries', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataModelSeriesService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseSalesType', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataSalesTypeService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseBodyType', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataBodyTypeService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseFuelType', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataFuelTypeService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseDriveType', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataDriveTypeService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseTransmissionType', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataTransmissionTypeService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseEquipmentChapter', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataEquipmentChapterService')

            return replication.send('replicate', { brand, id })
        })

        this.on('synchroniseEquipmentCategory', async ({ params: [, { brand_code: brand, id } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataEquipmentCategoryService')

            return replication.send('replicate', { brand, id })
        })

        return super.init()
    }
}
