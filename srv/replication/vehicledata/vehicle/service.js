module.exports = class ReplicationVehicledataVehicleService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('replication-vehicledata-vehicle')

        const db = await cds.connect.to('db')
        const client = await require('../connect')()

        const { Vehicles } = db.entities('retail.dwb')
        const { NotFoundError } = require('../errors')

        this.on('replication-vehicledata:VMSVehicle/Created', async ({ data: { VMSVehicleUUID } = {} } = {}) => replicate(VMSVehicleUUID))
        this.on('replication-vehicledata:VMSVehicle/Changed', async ({ data: { VMSVehicleUUID } = {} } = {}) => replicate(VMSVehicleUUID))
        this.on('replicate', async ({ data: { erpID } = {} } = {}) => replicate(erpID))

        const replicate = async (ID) => {
            LOG._debug && LOG.debug('replicate', ID)

            if (!ID) return

            try {
                const raw = await get(ID)
                LOG._debug && LOG.debug('raw', raw)

                const transformed = await transform(raw)
                LOG._debug && LOG.debug('transformed', transformed)

                return save(transformed)

            } catch (err) {
                if (err instanceof NotFoundError)
                    return remove(ID)

                LOG.warn(err)
                throw err
            }
        }

        const get = async (ID) => {
            return client.getVehicle({
                ID,
                $select: 'VMSVehicleUUID,VMSVehicleUsageStatus,VMSVehicleAvailabilityStatus',
                $expand: '_Extension($select=DWBKey,CustomerStatus,EndCustomerStatus,DeliveryCode)'
            })
        }

        const save = async (data) => {
            const { ID, erpID } = data
            const key = {
                property: 'ID',
                value: ID
            }

            let exists = await db.exists(Vehicles, { ID }).forUpdate()

            if (!exists) {
                exists = await db.exists(Vehicles, { erpID }).forUpdate()
                key.property = 'erpID'
                key.value = erpID
            }

            return exists
                ? db.update(Vehicles, { [key.property]: key.value }).set(data)
                : db.create(Vehicles, data)
        }

        const remove = async (erpID) => {
            const exists = await db.exists(Vehicles, { erpID }).forUpdate()

            if (exists)
                return db.delete(Vehicles, { erpID })
        }

        const transform = async (raw) => {
            const transformed = transformHeader(raw)

            return transformed
        }

        return super.init()
    }
}

const transformHeader = require('./transformHeader')
