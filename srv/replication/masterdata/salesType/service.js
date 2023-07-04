module.exports = class ReplicationMasterdataSalesTypeService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-masterdata-salestype')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { SalesTypes } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')
        const brands = require('../brands')

        this.on('replication-masterdata:salestype/changed', async ({ data: { BRAND, TYPE } = {} } = {}) => replicate(BRAND, TYPE))
        this.on('replication-masterdata:salestype/deleted', async ({ data: { BRAND, TYPE } = {} } = {}) => replicate(BRAND, TYPE))
        this.on('replicate', async ({ data: { brand, id } = {} } = {}) => replicate(brand, id))

        const replicate = async (brand, id) => {
            LOG._debug && LOG.debug('replicate', brand, id)

            if (!brand || !id) return

            try {
                const isBrand = await brands.exists(brand)
                LOG._debug && LOG.debug('isBrand', isBrand)

                if (!isBrand) throw new NotFoundError(`Brand ${brand} does not exists`)
                
                const raw = await get(brand, id)
                LOG._debug && LOG.debug('raw', raw)

                const transformed = await transform(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(brand, id)

                LOG.warn(err)
                throw err
            }
        }

        const get = async (brand, id) => {
            return client.getSalesType({
                brand,
                id,
                $expand: [
                    '_ModelSeries',
                    '_Texts'
                ].join(',')
            })
        }

        const save = async (data) => {
            const { brand_code, id } = data

            const exists = await db.exists(SalesTypes, { brand_code, id }).forUpdate()

            return exists
                ? db.update(SalesTypes, { brand_code, id }).set(data)
                : db.create(SalesTypes, data)
        }

        const remove = async (brand_code, id) => {
            const exists = await db.exists(SalesTypes, { brand_code, id }).forUpdate()

            if (exists)
                return db.delete(SalesTypes, { brand_code, id })
        }

        const transform = async (raw) => {
            const transformed = transformHeader(raw)

            transformed.texts = transformTexts(raw?._Texts)
            transformed.name = transformLocalized(transformed.texts, 'name')

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
const transformTexts = require('../transformTexts')
const transformLocalized = require('../transformLocalized')
