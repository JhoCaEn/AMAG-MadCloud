module.exports = class ReplicationMasterdataEquipmentService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-masterdata-equipment')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { Equipments } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')
        const brands = require('../brands')

        this.on('replication-masterdata:equipment/changed', async ({ data: { EQUIPMENT } = {} } = {}) => replicate(EQUIPMENT))
        this.on('replication-masterdata:equipment/deleted', async ({ data: { EQUIPMENT } = {} } = {}) => replicate(EQUIPMENT))
        this.on('replicate', async ({ data: { id } = {} } = {}) => replicate(id))

        const replicate = async (id) => {
            LOG._debug && LOG.debug('replicate', id)

            if (!id) return

            try {
                const raw = await get(id)
                LOG._debug && LOG.debug('raw', raw)

                const isBrand = await brands.exists(raw.Brand)
                LOG._debug && LOG.debug('isBrand', isBrand)

                if (!isBrand) throw new NotFoundError(`Brand ${raw.Brand} does not exists`)

                const transformed = await transform(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(id)

                LOG.warn(err)
                throw err
            }
        }

        const get = async (id) => {
            return client.getEquipment({
                id,
                $expand: [
                    '_Texts',
                    '_Chapter($select=Brand,Chapter)',
                    '_Category($select=Brand,Category)'
                ].join(',')
            })
        }

        const save = async (data) => {
            const { id } = data

            const exists = await db.exists(Equipments, id).forUpdate()

            return exists
                ? db.update(Equipments, id).set(data)
                : db.create(Equipments, data)
        }

        const remove = async (id) => {
            const exists = await db.exists(Equipments, id).forUpdate()

            if (exists)
                return db.delete(Equipments, id)
        }

        const transform = async (raw) => {
            const transformed = transformHeader(raw)

            transformed.texts = transformTexts(raw?._Texts, transformed.code)
            transformed.name = transformLocalized(transformed.texts, 'name')
            transformed.displayName = transformLocalized(transformed.texts, 'displayName')

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
const transformTexts = require('./transformTexts')
const transformLocalized = require('../transformLocalized')
