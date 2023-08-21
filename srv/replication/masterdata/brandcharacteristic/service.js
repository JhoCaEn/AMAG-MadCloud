module.exports = class ReplicationMasterdataBrandCharacteristicService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-masterdata-brandcharacteristics')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { BrandCharacteristics } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')
        const brands = require('../brands')

        this.on('replication-masterdata:brandcharacteristic/changed', async ({ data: { BRAND, TYPE } = {} } = {}) => replicate(BRAND, TYPE))
        this.on('replication-masterdata:brandcharacteristic/deleted', async ({ data: { BRAND, TYPE } = {} } = {}) => replicate(BRAND, TYPE))
        this.on('replicate', async ({ data: { brand, type } = {} } = {}) => replicate(brand, type))

        const replicate = async (brand, type) => {
            LOG._debug && LOG.debug('replicate', brand, type)

            if (!brand && !type) return
            if (!(await brands.exists(brand))) return

            try {
                const raw = await get(brand, type)
                LOG._debug && LOG.debug('raw', raw)

                const transformed = await transform(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)
            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(brand, type)

                LOG.warn(err)
                throw err
            }
        }

        const get = async (brand, type) => {
            return client.getBrandCharacteristic({ brand, type })
        }

        const save = async (data) => {
            if (!data) return

            const { brand_code, characteristic_code } = data

            const exists = await db.exists(BrandCharacteristics, { brand_code, characteristic_code }).forUpdate()

            return exists
                ? db.update(BrandCharacteristics, { brand_code, characteristic_code }).set(data)
                : db.create(BrandCharacteristics, data)
        }

        const remove = async (brand_code, type) => {
            const characteristics = {
                DA: 'configurationDate',
                MA: 'brand',
                TY: 'salesType',
                MO: 'engine',
                GE: 'transmission',
                MD: 'model',
                MJ: 'modelYear',
                AU: 'exteriorColor',
                IN: 'interiorColor',
                VD: 'roofColor',
                K1: 'equipment',
                Z1: 'internalWork',
                Z2: 'additionalWork'
            }

            const characteristic_code = characteristics[type]

            const exists = await db.exists(BrandCharacteristics, { brand_code, characteristic_code }).forUpdate()

            if (exists)
                return db.delete(BrandCharacteristics, { brand_code, characteristic_code })
        }

        const transform = async (raw) => {
            return transformHeader(raw)
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
