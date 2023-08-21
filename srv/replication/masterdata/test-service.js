module.exports = class ReplicationMasterdataTestService extends cds.ApplicationService {
    async init() {

        const model = await cds.connect.to('ReplicationMasterdataModelService')
        const color = await cds.connect.to('ReplicationMasterdataColorService')
        const engine = await cds.connect.to('ReplicationMasterdataEngineService')
        const transmission = await cds.connect.to('ReplicationMasterdataTransmissionService')
        const brandCharacteristic = await cds.connect.to('ReplicationMasterdataBrandCharacteristicService')
        const salesType = await cds.connect.to('ReplicationMasterdataSalesTypeService')
        const bodyType = await cds.connect.to('ReplicationMasterdataBodyTypeService')
        const modelSeries = await cds.connect.to('ReplicationMasterdataModelSeriesService')
        const equipment = await cds.connect.to('ReplicationMasterdataEquipmentService')
        const equipmentChapter = await cds.connect.to('ReplicationMasterdataEquipmentChapterService')
        const equipmentCategory = await cds.connect.to('ReplicationMasterdataEquipmentCategoryService')
        const driveType = await cds.connect.to('ReplicationMasterdataDriveTypeService')
        const transmissionType = await cds.connect.to('ReplicationMasterdataTransmissionTypeService')
        const fuelType = await cds.connect.to('ReplicationMasterdataFuelTypeService')
        const orderControl = await cds.connect.to('ReplicationMasterdataOrderControlsService')

        const replicate = async (service, data) => service.send('replicate', data).then(() => 'done')

        this.on('testModel', async ({ data }) => replicate(model, data))
        this.on('testStaticModel', async () => replicate(model, { id: 'MD000354' }))

        this.on('testColor', async ({ data }) => replicate(color, data))
        this.on('testStaticColor', async () => replicate(color, { id: 'FR000209' }))

        this.on('testEngine', async ({ data }) => replicate(engine, data))
        this.on('testStaticEngine', async () => replicate(engine, { id: 'MO000103' }))

        this.on('testTransmission', async ({ data }) => replicate(transmission, data))
        this.on('testStaticTransmission', async () => replicate(transmission, { id: 'GE000152' }))

        this.on('testBrandCharacteristic', async ({ data }) => replicate(brandCharacteristic, data))
        this.on('testStaticBrandCharacteristic', async () => replicate(brandCharacteristic, { brand: 'SEAT', type: 'K1' }))

        this.on('testSalesType', async ({ data }) => replicate(salesType, data))
        this.on('testStaticSalesType', async () => replicate(salesType, { brand: 'AUDI', id: 'A6AV' }))

        this.on('testBodyType', async ({ data }) => replicate(bodyType, data))
        this.on('testStaticBodyType', async () => replicate(bodyType, { brand: 'VW', id: 'LIM' }))

        this.on('testModelSeries', async ({ data }) => replicate(modelSeries, data))
        this.on('testStaticModelSeries', async () => replicate(modelSeries, { brand: 'AUDI', id: 'A6' }))

        this.on('testEquipment', async ({ data }) => replicate(equipment, data))
        this.on('testStaticEquipment', async () => replicate(equipment, { id: 'PR003010' }))

        this.on('testEquipmentChapter', async ({ data }) => replicate(equipmentChapter, data))
        this.on('testStaticEquipmentChapter', async () => replicate(equipmentChapter, { brand: 'VW', id: 'FAH' }))

        this.on('testEquipmentCategory', async ({ data }) => replicate(equipmentCategory, data))
        this.on('testStaticEquipmentCategory', async () => replicate(equipmentCategory, { brand: 'AUDI', id: 'ABLAGE' }))

        this.on('testDriveType', async ({ data }) => replicate(driveType, data))
        this.on('testStaticDriveType', async () => replicate(driveType, { brand: 'VW', id: 'HECK' }))

        this.on('testTransmissionType', async ({ data }) => replicate(transmissionType, data))
        this.on('testStaticTransmissionType', async () => replicate(transmissionType, { brand: 'AUDI', id: 'AUT' }))

        this.on('testFuelType', async ({ data }) => replicate(fuelType, data))
        this.on('testStaticFuelType', async () => replicate(fuelType, { brand: 'SEAT', id: 'GAS' }))

        this.on('testOrderControl', async ({ data }) => replicate(orderControl, data))
        this.on('testStaticOrderControl', async () => replicate(orderControl, { vehicleUsage: '01', customerState: '01', endCustomerState: '03' }))

        return super.init()
    }
}