module.exports = class AppOrdersService extends cds.ApplicationService {
    async init() {

        const db = await cds.connect.to('db')
        const { ValidationError } = require('../../lib/errors')

        const {
            Orders
        } = this.entities

        this.on('createOrder', async ({ data } = {}) => createOrder(data))

        this.before('CREATE', Orders, async ({ data } = {}) => setOrderFlags(data))
        this.after('CREATE', Orders, async ({ ID } = {}) => createERPOrder(ID))

        const createOrder = async ({ configuredAt, salesPartner_id, brand_code, model_id, exteriorColor_id, interiorColor_id, roofColor_id, equipments }) => {

            if (!brand_code)
                throw new ValidationError('CARCONFIGURATION_BRAND_NOT_GIVEN')

            const order = await this.send({
                event: 'NEW',
                query: db.create(Orders, {
                    configuredAt,
                    salesPartner_id,
                    brand_code,
                    model_id
                })
            })

            const { ID, DraftAdministrativeData_DraftUUID } = order

            await db.update(Orders.drafts, ID).set({
                exteriorColor_id,
                interiorColor_id,
                roofColor_id,
                configuredAt,
                equipments: equipments?.map(({ id: equipment_id }) => ({
                    vehicle_ID: ID,
                    equipment_id,
                    DraftAdministrativeData_DraftUUID,
                    IsActiveEntity: false,
                    HasActiveEntity: false,
                    HasDraftEntity: false
                })) || []
            })

            return ID
        }

        const setOrderFlags = (data) => {
            data.orderCreated = true
        }

        const createERPOrder = async (ID) => {
            const interfaceVehicleActions = await cds.connect.to('InterfacesVehicleActionsService')

            await interfaceVehicleActions.send('createOrder', { ID })
        }

        return super.init()
    }
}
