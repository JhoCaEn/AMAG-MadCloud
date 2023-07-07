module.exports = class AppBackofficeBrandsService extends cds.ApplicationService {

    async init() {

        this.on('synchroniseCharacteristic', async ({ params: [, { brand_code: brand, characteristic_code } = {}] = [] } = {}) => {
            const replication = await cds.connect.to('ReplicationMasterdataBrandCharacteristicService')

            const characteristics = {
                configurationDate: 'DA',
                brand: 'MA',
                salesType: 'TY',
                engine: 'MO',
                transmission: 'GE',
                model: 'MD',
                modelYear: 'MJ',
                exteriorColor: 'AU',
                interiorColor: 'IN',
                roofColor: 'VD',
                equipment: 'KI',
                internalWork: 'Z1',
                additionalWork: 'Z2',
            }

            const type = characteristics[characteristic_code]

            return replication.send('replicate', { brand, type })
        })

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
