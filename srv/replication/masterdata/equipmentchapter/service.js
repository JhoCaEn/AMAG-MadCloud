module.exports = class ReplicationMasterdataEquipmentChapterService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-masterdata-equipmentchapter')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { EquipmentChapters } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')
        const brands = require('../brands')

        this.on('replication-masterdata:equipmentchapter/changed', async ({ data: { BRAND, CHAPTER } = {} } = {}) => replicate(BRAND, CHAPTER))
        this.on('replication-masterdata:equipmentchapter/deleted', async ({ data: { BRAND, CHAPTER } = {} } = {}) => replicate(BRAND, CHAPTER))
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
            return client.getEquipmentChapter({
                id,
                brand,
                $expand: '_Texts'
            })
        }

        const save = async (data) => {
            const { brand_code, id } = data

            const exists = await db.exists(EquipmentChapters, { brand_code, id }).forUpdate()

            return exists
                ? db.update(EquipmentChapters, { brand_code, id }).set(data)
                : db.create(EquipmentChapters, data)
        }

        const remove = async (brand_code, id) => {
            const exists = await db.exists(EquipmentChapters, { brand_code, id }).forUpdate()

            if (exists)
                return db.delete(EquipmentChapters, { brand_code, id })
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
