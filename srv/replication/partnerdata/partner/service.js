module.exports = class ReplicationPartnerdataPartnerService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-partnerdata-partner')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { Partners } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')

        this.on('replication-partnerdata:BusinessPartner/Created/v1', async ({ data: { BusinessPartner } = {} } = {}) => replicate(BusinessPartner))
        this.on('replication-partnerdata:BusinessPartner/Changed/v1', async ({ data: { BusinessPartner } = {} } = {}) => replicate(BusinessPartner))
        this.on('replicate', async ({ data: { id } = {} } = {}) => replicate(id))

        const replicate = async (id) => {
            LOG._debug && LOG.debug('replicate', id)

            if (!id) return

            // TODO: replace with real logic
            if (id.length > 4) return

            try {
                const raw = await getSalesPartner(id)
                LOG._debug && LOG.debug('raw', raw)

                const transformed = await transformSalesPartner(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(id)

                LOG.warn(err)
                throw err
            }
        }

        const getSalesPartner = async (id) => {
            return client.getSalesPartner({
                id,
                $expand: '_BrandCharacteristics'
            })
        }

        const save = async (data) => {
            const { id } = data

            const exists = await db.exists(Partners, id).forUpdate()

            return exists
                ? db.update(Partners, id).set(data)
                : db.create(Partners, data)
        }

        const remove = async (id) => {
            const exists = await db.exists(Partners, id).forUpdate()

            if (exists)
                return db.delete(Partners, id)
        }

        const transformSalesPartner = async (raw) => {
            const transformed = transformHeader(raw)
            const brandCharacteristics = transformBrandCharacteristics(raw?._BrandCharacteristics)

            transformed.brands = transformBrands(brandCharacteristics)
            transformed.hasBrands = !!transformed.brands?.length

            transformed.brands.forEach(({ hasContracts, validFrom, validTo }) => {
                transformed.hasContracts = transformed.hasContracts ?? hasContracts

                if (!transformed.validFrom || transformed.validFrom > validFrom)
                    transformed.validFrom = validFrom

                if (!transformed.validTo || transformed.validTo < validTo)
                    transformed.validTo = validTo
            })

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
const transformBrandCharacteristics = require('./transformBrandCharacteristics')
const transformBrands = require('./transformBrands')
