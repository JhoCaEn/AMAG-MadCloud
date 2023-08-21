module.exports = class PricingSalesPriceService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('salespricing')
        const db = await cds.connect.to('db')

        const {
            CurrentModelEquipmentSalesPrices,
            CurrentModelColorCombinationSalesPrices,
            CurrentModelSalesPrices
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
            const modelPrices = await readModelPrices({ model_id })

            const calculations = prepareCalculations({ equipments, colorPrices, equipmentPrices })
            calculatePrices({ calculations, colors: [exteriorColor_id, interiorColor_id, roofColor_id], equipments })

            return updateConstraints({ table, ID, equipments, calculations, modelPrices })
        }

        const readColorPrices = async ({ model_id, exteriorColor_id: exterior_id, interiorColor_id: interior_id, roofColor_id: roof_id }) => {
            return db.read(CurrentModelColorCombinationSalesPrices, ['type_code as id', 'constraintEquipment_id', 'constraintColor_id', 'weighting', 'value', 'currency'])
                .where({ model_id, exterior_id, interior_id, roof_id })
                .orderBy('weighting desc')
        }

        const readEquipmentPrices = async ({ model_id, equipments }) => {
            if (!equipments?.length) return []

            return db.read(CurrentModelEquipmentSalesPrices, ['equipment_id as id', 'constraintEquipment_id', 'constraintColor_id', 'weighting', 'value', 'currency'])
                .where({ model_id, equipment_id: equipments })
                .orderBy('weighting desc')
        }

        const readModelPrices = async ({ model_id }) => {
            if (!model_id) return []

            return db.read(CurrentModelSalesPrices, ['value', 'currency'])
                .where({ model_id })
        }

        const prepareCalculations = ({ equipments, colorPrices, equipmentPrices }) => {
            const calculations = {
                E: {
                    constraintEquipment_id: '',
                    constraintColor_id: '',
                    salesPriceValue: null,
                    salesPriceValueCurrency: null,
                    prices: []
                },
                I: {
                    constraintEquipment_id: '',
                    constraintColor_id: '',
                    salesPriceValue: null,
                    salesPriceValueCurrency: null,
                    prices: []
                },
                R: {
                    constraintEquipment_id: '',
                    constraintColor_id: '',
                    salesPriceValue: null,
                    salesPriceValueCurrency: null,
                    prices: []
                },
                ...equipments.reduce((current, id) => ({
                    ...current,
                    [id]: {
                        constraintEquipment_id: '',
                        constraintColor_id: '',
                        salesPriceValue: null,
                        salesPriceValueCurrency: null,
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

                for (const { constraintEquipment_id, constraintColor_id, value, currency } of calculation.prices) {

                    if (constraintEquipment_id && !equipments?.includes(constraintEquipment_id))
                        continue

                    if (constraintColor_id && !colors?.includes(constraintColor_id))
                        continue

                    calculation.constraintEquipment_id = constraintEquipment_id
                    calculation.constraintColor_id = constraintColor_id
                    calculation.salesPriceValue = value
                    calculation.salesPriceValueCurrency = currency

                    break
                }
            })
        }

        const updateConstraints = async ({ table, ID, equipments, calculations, modelPrices }) => {
            return db.update(table, { ID }).set({
                ID: ID,
                modelSalesPriceValue: modelPrices?.[0].value || null,
                modelSalesPriceCurrency: modelPrices?.[0].currency || null,
                exteriorColorSalesPriceConstraintEquipment_id: calculations.E.constraintEquipment_id,
                exteriorColorSalesPriceConstraintColor_id: calculations.E.constraintColor_id,
                exteriorColorSalesPriceValue: calculations.E.salesPriceValue,
                exteriorColorSalesPriceCurrency: calculations.E.salesPriceValueCurrency,
                interiorColorSalesPriceConstraintEquipment_id: calculations.I.constraintEquipment_id,
                interiorColorSalesPriceConstraintColor_id: calculations.I.constraintColor_id,
                interiorColorSalesPriceValue: calculations.I.salesPriceValue,
                interiorColorSalesPriceCurrency: calculations.I.salesPriceValueCurrency,
                roofColorSalesPriceConstraintEquipment_id: calculations.R.constraintEquipment_id,
                roofColorSalesPriceConstraintColor_id: calculations.R.constraintColor_id,
                roofSalesPriceValue: calculations.R.salesPriceValue,
                roofSalesPriceCurrency: calculations.R.salesPriceValueCurrency,
                equipments: equipments.map(id => ({
                    equipment_id: id,
                    salesPriceConstraintEquipment_id: calculations[id].constraintEquipment_id,
                    salesPriceConstraintColor_id: calculations[id].constraintColor_id,
                    salesPriceValue: calculations[id].salesPriceValue,
                    salesPriceValueCurrency: calculations[id].salesPriceValueCurrency
                })),
            })
        }

        return super.init()
    }
}
