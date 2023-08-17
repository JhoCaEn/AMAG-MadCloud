module.exports = class PricingSalesPriceService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('salespricing')
        const db = await cds.connect.to('db')

        const {
            CurrentModelEquipmentSalesPrices,
            CurrentModelColorCombinationSalesPrices
        } = db.entities('retail.dwb')

        this.on('calculate', async ({ data } = {}) => calculate(data))

        const calculate = async ({ table, ID } = {}) => {
            LOG._debug && LOG.debug('table', table)
            LOG._debug && LOG.debug('ID', ID)

            if (!table) return
            if (!ID) return

            const exists = await db.exists(table, { ID }).forUpdate()
            if (!exists) return

            const data = await db.read(table, { ID }, x => { x.model_id, x.exteriorColor_id, x.interiorColor_id, x.roofColor_id, x.equipments(e => { e.equipment_id }) })

            const { model_id, exteriorColor_id, interiorColor_id, roofColor_id } = data
            const equipments = data.equipments.map(item => item.equipment_id)

            const colorPrices = await readColorPrices({ model_id, exteriorColor_id, interiorColor_id, roofColor_id })
            const equipmentPrices = await readEquipmentPrices({ model_id, equipments })

            const calculations = prepareCalculations({ equipments, colorPrices, equipmentPrices })
            calculatePrices({ calculations, colors: [exteriorColor_id, interiorColor_id, roofColor_id], equipments })

            return updateConstraints({ table, ID, equipments, calculations })
        }

        const readColorPrices = async ({ model_id, exteriorColor_id: exterior_id, interiorColor_id: interior_id, roofColor_id: roof_id }) => {
            return db.read(CurrentModelColorCombinationSalesPrices, ['type_code as id', 'constraintEquipment_id', 'constraintColor_id', 'weighting'])
                .where({ model_id, exterior_id, interior_id, roof_id })
                .orderBy( 'weighting desc' )
        }

        const readEquipmentPrices = async ({ model_id, equipments }) => {
            if (!equipments?.length) return []

            return db.read(CurrentModelEquipmentSalesPrices, ['equipment_id as id', 'constraintEquipment_id', 'constraintColor_id', 'weighting'])
                .where({ model_id, equipment_id: equipments })
                .orderBy( 'weighting desc' )
        }

        const prepareCalculations = ({ equipments, colorPrices, equipmentPrices }) => {
            const calculations = {
                E: {
                    constraintEquipment_id: '',
                    constraintColor_id: '',
                    prices: []
                },
                I: {
                    constraintEquipment_id: '',
                    constraintColor_id: '',
                    prices: []
                },
                R: {
                    constraintEquipment_id: '',
                    constraintColor_id: '',
                    prices: []
                },
                ...equipments.reduce((current, id) => ({ 
                    ...current,
                    [id]: {
                        constraintEquipment_id: '',
                        constraintColor_id: '',
                        prices: []
                    }
                }), {})
            }

            colorPrices.forEach(price => calculations[price.id].prices.push(price))
            equipmentPrices.forEach(price => calculations[price.id].prices.push(price))

            return calculations
        }

        const calculatePrices = ({ calculations, colors, equipments }) => {
            Object.keys(calculations).forEach(id => {
                const calculation = calculations[id]

                for ( const {constraintEquipment_id, constraintColor_id } of calculation.prices ) {

                    if (constraintEquipment_id && !equipments?.includes(constraintEquipment_id))
                        continue

                    if (constraintColor_id && !colors?.includes(constraintColor_id))
                        continue

                    calculation.constraintEquipment_id = constraintEquipment_id
                    calculation.constraintColor_id = constraintColor_id

                    break
                }
            })
        }

        const updateConstraints = async ({ table, ID, equipments, calculations }) => {
            return db.update(table, { ID }).set({
                ID: ID,
                exteriorColorSalesPriceConstraintEquipment_id: calculations.E.constraintEquipment_id,
                exteriorColorSalesPriceConstraintColor_id: calculations.E.constraintColor_id,
                interiorColorSalesPriceConstraintEquipment_id: calculations.I.constraintEquipment_id,
                interiorColorSalesPriceConstraintColor_id: calculations.I.constraintColor_id,                
                roofColorSalesPriceConstraintEquipment_id: calculations.R.constraintEquipment_id,
                roofColorSalesPriceConstraintColor_id: calculations.R.constraintColor_id,
                equipments: equipments.map(id => ({
                    equipment_id: id,
                    salesPriceConstraintEquipment_id: calculations[id].constraintEquipment_id,
                    salesPriceConstraintColor_id: calculations[id].constraintColor_id
                })),                
            })
        }

        return super.init()
    }
}
