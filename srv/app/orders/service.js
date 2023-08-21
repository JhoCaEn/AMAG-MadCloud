module.exports = class AppOrdersService extends cds.ApplicationService {
    async init() {

        const db = await cds.connect.to('db')
        const { ValidationError } = require('../../lib/errors')

        const {
            Orders
        } = this.entities

        this.on('createOrder', async ({ data } = {}) => createOrder(data))

        const createOrder = async ({ configuredAt, brand_code, salesOrganisation, model_id, exteriorColor_id,
            exteriorColorSalesPriceConstraintColor_id, exteriorColorSalesPriceConstraintEquipment_id, interiorColor_id,
            interiorColorSalesPriceConstraintColor_id, interiorColorSalesPriceConstraintEquipment_id, roofColor_id,
            roofColorSalesPriceConstraintColor_id, roofColorSalesPriceConstraintEquipment_id,
            equipments }) => {

            if (!brand_code)
                throw new ValidationError('CARCONFIGURATION_BRAND_NOT_GIVEN')

            if (!salesOrganisation)
                throw new ValidationError('CARCONFIGURATION_SALES_ORGANISATION_NOT_GIVEN')

            const order = await this.send({
                event: 'NEW',
                query: db.create(Orders, {
                    brand_code,
                    salesOrganisation,
                    model_id
                })
            })

            const { ID, DraftAdministrativeData_DraftUUID } = order

            await db.update(Orders.drafts, ID).set({
                exteriorColor_id,
                exteriorColorSalesPriceConstraintColor_id,
                exteriorColorSalesPriceConstraintEquipment_id,
                interiorColor_id,
                interiorColorSalesPriceConstraintColor_id,
                interiorColorSalesPriceConstraintEquipment_id,
                roofColor_id,
                roofColorSalesPriceConstraintColor_id,
                roofColorSalesPriceConstraintEquipment_id,
                equipments: equipments?.map(({ id: equipment_id, salesPriceConstraintEquipment_id, salesPriceConstraintColor_id }) => ({
                    vehicle_ID: ID,
                    equipment_id,
                    salesPriceConstraintEquipment_id,
                    salesPriceConstraintColor_id,
                    DraftAdministrativeData_DraftUUID,
                    IsActiveEntity: false,
                    HasActiveEntity: false,
                    HasDraftEntity: false
                })) || []
            })

            return ID
        }

        return super.init()
    }
}
