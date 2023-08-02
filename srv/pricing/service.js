module.exports = class PricingSalesPriceService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('salesprice')
        const db = await cds.connect.to('db')

        const {
            ModelEquipmentSalesPrices,
            ModelColorCombinationSalesPrices
        } = db.entities('retail.dwb')

        this.on('calculate', async ({ data } = {}) => calculate(data))

        const calculate = async ({ table, ID } = {}) => {
            LOG._debug && LOG.debug('table', table)
            LOG._debug && LOG.debug('ID', ID)

            if (!table) return
            if (!ID) return

            const data = await db.read(table, { ID }, x => { x.model_id, x.exteriorColor_id, x.interiorColor_id, x.roofColor_id, x.equipments(e => { e.equipment_id }) })

            if (!data) return

            const colors = {
                exterior: data.exteriorColor_id,
                interior: data.interiorColor_id,
                roof: data.roofColor_id
            }
            const equipments = data.equipments.map(item => item.equipment_id)

            const equipmentPrices = await calculateEquipmentsPrices(data.model_id, Object.values(colors), equipments)
            const exteriorColorPrices = await calculateColorPrice(data.model_id, colors, equipments, 'E')
            const interiorColorPrices = await calculateColorPrice(data.model_id, colors, equipments, 'I')
            const roofColorPrices = await calculateColorPrice(data.model_id, colors, equipments, 'R')

            await db.update(table, { ID }).set({
                ID: ID,
                equipments: equipmentPrices,
                ...exteriorColorPrices,
                ...interiorColorPrices,
                ...roofColorPrices
            })
        }

        const calculateEquipmentsPrices = async (equipment_model_id, colors, equipments) => {
            const salesPrices = await db.read(ModelEquipmentSalesPrices, ['equipment_equipment_id', 'constraintEquipment_id', 'constraintColor_id', 'weighting'])
                .where({
                    equipment_model_id,
                    equipment_equipment_id: equipments
                })
                .where('current_date between validFrom and validTo')

            if (!salesPrices.length) return []

            const sellingPriceEquipments = determineSellingPrice(salesPrices, equipments, colors, sellingPriceResponseKeys.equipments)

            return sellingPriceEquipments.map(({ equipment_equipment_id, constraintEquipment_id, constraintColor_id }) => ({ equipment_id: equipment_equipment_id, salesPriceConstraintEquipment_id: constraintEquipment_id, salesPriceConstraintColor_id: constraintColor_id }))
        }

        const calculateColorPrice = async (colorCombination_model_id, colors, equipments, type_code) => {
            const salesPrices = await db.read(ModelColorCombinationSalesPrices, [sellingPriceResponseKeys[type_code], 'constraintEquipment_id', 'constraintColor_id', 'weighting'])
                .where({
                    colorCombination_model_id,
                    colorCombination_exterior_id: colors.exterior || '',
                    colorCombination_interior_id: colors.interior || '',
                    colorCombination_roof_id: colors.roof || '',
                    type_code
                })
                .where('current_date between validFrom and validTo')

            if (!salesPrices.length) return {}

            const sellingPriceColor = determineSellingPrice(salesPrices, equipments, Object.values(colors), sellingPriceResponseKeys[type_code])

            if (!sellingPriceColor.length) return {}

            return {
                [colorPriceResponseFields[type_code].color]: sellingPriceColor[0][sellingPriceResponseKeys[type_code]],
                [colorPriceResponseFields[type_code].constraintEquipment]: sellingPriceColor[0].constraintEquipment_id,
                [colorPriceResponseFields[type_code].constraintColor]: sellingPriceColor[0].constraintColor_id
            }
        }

        const determineSellingPrice = require('./determineSellingPrice')

        const sellingPriceResponseKeys = {
            equipments: 'equipment_equipment_id',
            E: 'colorCombination_exterior_id',
            I: 'colorCombination_interior_id',
            R: 'colorCombination_roof_id'
        }

        const colorPriceResponseFields = {
            E: {
                color: 'exteriorColor_id',
                constraintEquipment: 'exteriorColorSalesPriceConstraintEquipment_id',
                constraintColor: 'exteriorColorSalesPriceConstraintColor_id'
            },
            I: {
                color: 'interiorColor_id',
                constraintEquipment: 'interiorColorSalesPriceConstraintEquipment_id',
                constraintColor: 'interiorColorSalesPriceConstraintColor_id'
            },
            R: {
                color: 'roofColor_id',
                constraintEquipment: 'roofColorSalesPriceConstraintEquipment_id',
                constraintColor: 'roofColorSalesPriceConstraintColor_id'
            }
        }

        return super.init()
    }
}
