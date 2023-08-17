module.exports = class ReplicationMasterdataOrderControlsService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-masterdata-ordercontrol')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { OrderControls, Partners } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')

        this.on('replication-masterdata:ordercontrol/created', async ({ data: { VEHICLEUSAGE, CUSTOMERSTATUS, ENDCUSTOMERSTATUS } = {} } = {}) => replicate(VEHICLEUSAGE, CUSTOMERSTATUS, ENDCUSTOMERSTATUS))
        this.on('replication-masterdata:ordercontrol/changed', async ({ data: { VEHICLEUSAGE, CUSTOMERSTATUS, ENDCUSTOMERSTATUS } = {} } = {}) => replicate(VEHICLEUSAGE, CUSTOMERSTATUS, ENDCUSTOMERSTATUS))
        this.on('replication-masterdata:ordercontrol/deleted', async ({ data: { VEHICLEUSAGE, CUSTOMERSTATUS, ENDCUSTOMERSTATUS } = {} } = {}) => replicate(VEHICLEUSAGE, CUSTOMERSTATUS, ENDCUSTOMERSTATUS))
        this.on('replicate', async ({ data: { vehicleUsage, customerState, endCustomerState } = {} } = {}) => replicate(vehicleUsage, customerState, endCustomerState))

        const replicate = async (vehicleUsage, customerState, endCustomerState) => {
            LOG._debug && LOG.debug('replicate', vehicleUsage, customerState, endCustomerState)

            if (!vehicleUsage || !customerState || !endCustomerState) return

            try {
                const raw = await get(vehicleUsage, customerState, endCustomerState)
                LOG._debug && LOG.debug('raw', raw)

                const transformed = await transform(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(vehicleUsage, customerState, endCustomerState)

                LOG.warn(err)
                throw err
            }
        }

        const get = async (vehicleUsage, customerState, endCustomerState) => {
            return client.getOrderControl({
                vehicleUsage,
                customerState,
                endCustomerState
            })
        }

        const save = async (data) => {
            const { vehicleUsage_code, customerState_code, endCustomerState_code } = data

            const exists = await db.exists(OrderControls, { vehicleUsage_code, customerState_code, endCustomerState_code }).forUpdate()

            await (exists
                ? db.update(OrderControls, { vehicleUsage_code, customerState_code, endCustomerState_code }).set(data)
                : db.create(OrderControls, data)
            );

            let orderPartners = [];
            ['soldToPartner_id', 'shipToPartner_id', 'billToPartner_id', 'paidByPartner_id'].forEach(property => {
                if (data[property]) orderPartners.push(data[property])
            })

            if (!orderPartners.length)
                return

            orderPartners = [...new Set(orderPartners)]

            const knownPartners = await db.read(Partners, ['id']).where({ id: orderPartners })
                .then(result => result.map(({ id }) => id))

            const missingPartners = orderPartners.filter(id => !knownPartners.includes(id))

            if (!missingPartners.length)
                return

            await db.create(Partners, missingPartners.map(id => ({ id })))

            await Promise.all(missingPartners.map(id => this.emit('partner/replicate', { id })))                
        }

        const remove = async (vehicleUsage_code, customerState_code, endCustomerState_code) => {
            const exists = await db.exists(OrderControls, { vehicleUsage_code, customerState_code, endCustomerState_code }).forUpdate()

            if (exists)
                return db.delete(OrderControls, { vehicleUsage_code, customerState_code, endCustomerState_code })
        }

        const transform = async (raw) => {
            const transformed = transformHeader(raw)

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
