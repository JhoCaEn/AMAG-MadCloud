module.exports = class ReplicationMasterdataModelService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-masterdata-model')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { Models } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')
        const brands = require('../brands')

        this.on('replication-masterdata:model/changed', async ({ data: { MODEL } = {} } = {}) => replicate(MODEL))
        this.on('replication-masterdata:model/deleted', async ({ data: { MODEL } = {} } = {}) => replicate(MODEL))
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
            return client.getModel({
                id,
                $expand: [
                    '_Engine($select=Engine)',
                    '_Transmission($select=Transmission)',
                    '_SalesType($select=Brand,Type)',
                    '_BodyType($select=Brand,Type)',
                    '_SalesPrices',
                    '_Texts',
                    `_Restrictions($expand=${[
                        '_Color($select=Color)',
                        '_Equipment($select=Equipment)'
                    ].join(',')})`,
                    `_ColorCombinations($expand=${[
                        '_Exterior($select=Color)',
                        '_Interior($select=Color)',
                        '_Roof($select=Color)',
                        `_Restrictions($expand=${[
                            '_Color($select=Color)',
                            '_Equipment($select=Equipment)'
                        ].join(',')})`,
                        `_ConstraintRestrictions($expand=${[
                            '_Color($select=Color)',
                            '_Equipment($select=Equipment)'
                        ].join(',')})`
                    ].join(',')})`,
                    `_Equipments($expand=${[
                        '_Equipment($select=Equipment)',
                        `_PackageContent($expand=${[
                            '_Equipment($select=Equipment)'
                        ].join(',')})`,
                        `_Restrictions($expand=${[
                            '_Color($select=Color)',
                            '_Equipment($select=Equipment)'
                        ].join(',')})`,
                        `_ConstraintRestrictions($expand=${[
                            '_Color($select=Color)',
                            '_Equipment($select=Equipment)'
                        ].join(',')})`
                    ].join(',')})`
                ].join(',')
            })
        }

        const save = async (data) => {
            const { id } = data

            const exists = await db.exists(Models, id).forUpdate()

            return exists
                ? db.update(Models, id).set(data)
                : db.create(Models, data)
        }

        const remove = async (id) => {
            const exists = await db.exists(Models, id).forUpdate()

            if (exists)
                return db.delete(Models, id)
        }

        const transform = async (raw) => {
            const transformed = transformHeader(raw)

            transformed.texts = transformTexts(raw?._Texts)
            transformed.name = transformLocalized(transformed.texts, 'name')
            transformed.colorCombinations = transformColorCombinations(raw?._ColorCombinations)
            transformed.colors = transformColors(transformed.colorCombinations, transformed.brand_code)
            transformed.salesPrices = transformSalesPrices(raw?._SalesPrices)
            transformed.equipments = transformEquipments(raw?._Equipments, transformed.brand_code)
            transformed.restrictions = transformRestrictions(raw._Restrictions, transformed.brand_code)

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
const transformTexts = require('../transformTexts')
const transformLocalized = require('../transformLocalized')
const transformColorCombinations = require('./transformColorCombinations')
const transformColors = require('./transformColors')
const transformSalesPrices = require('./transformSalesPrices')
const transformEquipments = require('./transformEquipments')
const transformRestrictions = require('./transformRestrictions')