module.exports = class InterfacesVehicleActionsService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('interfaces-vehicle-actions')

        const db = await cds.connect.to('db')
        const client = await require('./connect')()

        const { ValidationError } = require('../../lib/errors')

        const {
            Vehicles
        } = db.entities('retail.dwb')


        this.on('createOrder', async ({ data } = {}) => createOrder(data))

        const createOrder = async ({ ID } = {}) => {
            LOG._debug && LOG.debug('ID', ID)

            if (!ID)
                throw new ValidationError('VEHICLE_ID_NOT_GIVEN')

            const order = await db.read(Vehicles, { ID }, v => {
                v.ID,
                    v.configuredAt,
                    v.salesPartner_id,
                    v.soldToPartner_id,
                    v.shipToPartner_id,
                    v.billToPartner_id,
                    v.paidByPartner_id,
                    v.usage_code,
                    v.customerState_code,
                    v.endCustomerState_code,
                    v.availability_code,
                    v.deliveryCode_code,
                    v.brand(b => {
                        b.code,
                        b.distributionChannel,
                        b.organizationDivision,
                        b.characteristics(ch => {
                            ch.characteristic_code,
                            ch.value
                        })
                    }),
                    v.model(m => {
                        m.code,
                        m.year,
                        m.technicalKey,
                        m.engine_id,
                        m.transmission_id,
                        m.salesType(s => {
                            s.id,
                                s.material,
                                s.salesOrganisation
                        })
                    }),
                    v.exteriorColor(ext => {
                        ext.technicalKey
                    }),
                    v.interiorColor(int => {
                        int.technicalKey
                    }),
                    v.roofColor(roof => {
                        roof.technicalKey
                    }),
                    v.equipments(equip => {
                        equip.equipment(eq => {
                        eq.technicalKey,
                            eq.chapter(c => {
                                c.characteristicName
                            })
                        })
                    })
            })

            const payload = transformationCreateOrderHeader(order)
            payload['to_Configurations'] = transformCreateOrderConfigurations(order)
            LOG._debug && LOG.debug('erp payload', payload)

            const erpID = await client.createVehicle(payload)
            LOG._debug && LOG.debug('erpID', erpID)

            await db.update(Vehicles, { ID }).set({ erpID })
        }

        return super.init()
    }
}

const transformationCreateOrderHeader = require('./transformationCreateOrderHeader')
const transformCreateOrderConfigurations = require('./transformCreateOrderConfigurations')
