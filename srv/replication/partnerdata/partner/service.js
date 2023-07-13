module.exports = class ReplicationPartnerdataPartnerService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-partnerdata-partner')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { Partners } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')

        this.on('replication-partnerdata:BusinessPartner/Created/v1', async ({ data: { BusinessPartner } = {} } = {}) => replicate(BusinessPartner))
        this.on('replication-partnerdata:BusinessPartner/Changed/v1', async ({ data: { BusinessPartner } = {} } = {}) => replicate(BusinessPartner))
        this.on('self:partner/replicate', async ({ data: { id } = {} } = {}) => replicate(id))
        this.on('replicate', async ({ data: { id } = {} } = {}) => replicate(id))

        const replicate = async (id) => {
            LOG._debug && LOG.debug('replicate', id)

            if (!id) return

            return id.length <= 4
                ? replicateSalesPartner(id)
                : replicatePartner(id)
        }

        const replicatePartner = async (id) => {
            try {

                if (!(await db.exists(Partners, id)))
                    return

                const raw = await getPartner(id)
                LOG._debug && LOG.debug('raw', raw)

                if (!raw) return remove(id)

                const transformed = await transformPartner(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(id)

                LOG.warn(err)
                throw err
            }
        }

        const replicateSalesPartner = async (id) => {
            try {

                const raw = await getSalesPartner(id)
                LOG._debug && LOG.debug('raw', raw)

                if (!raw) throw new NotFoundError()

                const transformed = await transformSalesPartner(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return replicatePartner(id)

                LOG.warn(err)
                throw err
            }
        }

        const getSalesPartner = async (id) => {
            return client.getSalesPartner({
                id,
                $expand: '_BrandCharacteristics,_Roles($expand=_RolePartner($select=Partner))'
            })
        }

        const getPartner = async (id) => {
            return client.getPartner({ id })
        }

        const save = async (data) => {
            const { id, brands = [] } = data

            const exists = await db.exists(Partners, id).forUpdate()

            await (exists
                ? db.update(Partners, id).set(data)
                : db.create(Partners, data)
            )

            const rolePartners = [...new Set([
                brands.map(({ soldToPartners, shipToPartners, billToPartners, paidByPartners }) => ([
                    soldToPartners?.map(({ partner_id }) => partner_id),
                    shipToPartners?.map(({ partner_id }) => partner_id),
                    billToPartners?.map(({ partner_id }) => partner_id),
                    paidByPartners?.map(({ partner_id }) => partner_id)
                ])),
            ].flat(3))]

            if (!rolePartners.length)
                return

            const knownPartners = await db.read(Partners, ['id']).where({ id: rolePartners })
                .then(result => result.map(({ id }) => id))

            const missingPartners = rolePartners.filter(id => !knownPartners.includes(id))

            if (!missingPartners.length)
                return

            await db.create(Partners, missingPartners.map(id => ({ id })))

            await Promise.all(missingPartners.map(id => this.emit('partner/replicate', { id })))
        }

        const remove = async (id) => {
            const exists = await db.exists(Partners, id).forUpdate()

            if (exists)
                return db.delete(Partners, id)
        }

        const transformSalesPartner = async (raw) => {
            const transformed = transformHeader(raw)
            const brandCharacteristics = transformBrandCharacteristics(raw?._BrandCharacteristics)
            const brandRoles = transformBrandRoles(raw?._Roles)

            transformed.brands = transformBrands(brandCharacteristics, brandRoles)
            transformed.hasBrands = !!transformed.brands?.length

            transformed.brands.forEach(({ hasContracts, validFrom, validTo }) => {
                transformed.hasContracts = transformed.hasContracts ?? hasContracts

                if (!transformed.validFrom || transformed.validFrom > validFrom)
                    transformed.validFrom = validFrom

                if (!transformed.validTo || transformed.validTo < validTo)
                    transformed.validTo = validTo
            })

            transformed.isSalesPartner = transformed.hasBrands && transformed.hasContracts

            return transformed
        }

        const transformPartner = async (raw) => {
            const transformed = transformHeader(raw)

            transformed.validFrom = '1970-01-01'
            transformed.validTo = '9999-12-31'

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
const transformBrandCharacteristics = require('./transformBrandCharacteristics')
const transformBrands = require('./transformBrands')
const transformBrandRoles = require('./transformBrandRoles')