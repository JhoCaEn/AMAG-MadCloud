module.exports = class AppCarConfiguratorService extends cds.ApplicationService {
    async init() {

        const db = await cds.connect.to('db')
        const { ValidationError } = require('../../lib/errors')

        const {
            Configurations,
            ConfigurationEquipments,
        } = this.entities

        const {
            CarConfigurationSelectableSalesTypes: SelectableSalesTypes,
            CarConfigurationSelectableModelCategories: SelectableModelCategories,
            CarConfigurationSelectableModels: SelectableModels,
            CarConfigurationSelectableModelSalesPrices: SelectableModelSalesPrices,
            CarConfigurationSelectableModelRestrictions: SelectableModelRestrictions,
            CarConfigurationSelectableColors: SelectableColors,
            CarConfigurationSelectableColorTypes: SelectableColorTypes,
            CarConfigurationSelectableColorCombinations: SelectableColorCombinations,
            CarConfigurationSelectableEquipments: SelectableEquipments,
            CarConfigurationSelectableEquipmentChapters: SelectableEquipmentChapters,
            CarConfigurationSelectableEquipmentCategories: SelectableEquipmentCategories,
            PartnerBrands,
            PartnerBrandContracts,
            BrandContractTypeModelCategories,
            SalesTypes,
            Models,
            ModelSalesPrices,
            ModelRestrictions,
            CarConfigurationModelColorsPrepared: ModelColors,
            ModelColorCombinations,
            CarConfigurationModelEquipmentsPrepared: ModelEquipments,
            CarConfigurationSelectableEquipmentsPrepared: SelectableEquipmentsPrepared
        } = db.entities('retail.dwb')


        this.on('createConfiguration', async ({ data: { configuredAt, partner_id, brand_code, salesOrganisation, isNewConfiguration = true, model_id, exteriorColor_id, interiorColor_id, roofColor_id, equipments } = {} } = {}) => createConfiguration(configuredAt, partner_id, brand_code, salesOrganisation, isNewConfiguration, model_id, exteriorColor_id, interiorColor_id, roofColor_id, equipments))
        this.on('readConfiguration', async ({ data: { ID } = {} } = {}) => readConfiguration({ ID }))
        this.on('prepare', async ({ params: [{ ID } = {}] = [] } = {}) => prepare({ ID }))
        this.on('selectModel', async ({ params: [{ ID } = {}] = [], data: { id } = {} } = {}) => selectModel({ ID, id }))
        this.on('selectColor', async ({ params: [{ ID } = {}] = [], data: { id } = {} } = {}) => selectColor({ ID, id }))
        this.on('unselectColor', async ({ params: [{ ID } = {}] = [], data: { id } = {} } = {}) => unselectColor({ ID, id }))
        this.on('selectEquipment', async ({ params: [{ ID } = {}] = [], data: { id } = {} } = {}) => selectEquipment({ ID, id }))
        this.on('unselectEquipment', async ({ params: [{ ID } = {}] = [], data: { id } = {} } = {}) => unselectEquipment({ ID, id }))
        this.before('CREATE', Configurations, async ({ data: { ID } = {} } = {}) => checkConfigurationSaveable({ ID }))

        this.before('NEW', Configurations, async (req) => {
            if (!req.data.configuredAt)
                req.data.configuredAt = req.timestamp.toISOString().substring(0, 10)
        })

        const createConfiguration = async (configuredAt, partner_id, brand_code, salesOrganisation, isNewConfiguration, model_id, exteriorColor_id, interiorColor_id, roofColor_id, equipments) => {
            if (!partner_id)
                throw new ValidationError('CARCONFIGURATION_PARTNER_NOT_GIVEN')

            if (!brand_code)
                throw new ValidationError('CARCONFIGURATION_BRAND_NOT_GIVEN')

            if (!salesOrganisation)
                throw new ValidationError('CARCONFIGURATION_SALES_ORGANISATION_NOT_GIVEN')


            const configuration = await this.send({
                event: 'NEW',
                query: db.create(Configurations, {
                    partner_id,
                    brand_code,
                    salesOrganisation,
                    isNewConfiguration,
                    configuredAt
                })
            })

            const { ID, DraftAdministrativeData_DraftUUID } = configuration

            await db.update(Configurations.drafts, ID).set({
                preselectedModel_id: model_id,
                preselectedExteriorColor_id: exteriorColor_id,
                preselectedInteriorColor_id: interiorColor_id,
                preselectedRoofColor_id: roofColor_id,
                preselectedEquipments: equipments?.map(id => ({ 
                    configuration_ID: ID,
                    equipment_id: id,
                    DraftAdministrativeData_DraftUUID,
                    IsActiveEntity: false,
                    HasActiveEntity: false,
                    HasDraftEntity: false                    
                })) || []
            })

            return ID
        }


        const selectModel = async ({ ID, id }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            if (!id)
                throw new ValidationError('CARCONFIGURATION_MODEL_ID_NOT_GIVEN')

            const configuration_ID = ID
            const model_id = id

            const configurationExists = await db.exists(Configurations.drafts, ID)
            if (!configurationExists)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const modelExists = await db.exists(SelectableModels, { configuration_ID, model_id })
            if (!modelExists)
                throw new ValidationError('CARCONFIGURATION_MODEL_ID_NOT_VALID')


            await db.update(Configurations.drafts, ID).set({ model_id })
            await db.update(SelectableModels, { configuration_ID }).set({ selected: false })
            await db.update(SelectableModels, { configuration_ID, model_id }).set({ selected: true })

            await Promise.all([
                prepareSelectableColors({ ID }),
                prepareSelectableColorCombinations({ ID }),
                prepareSelectableEquipments({ ID })
            ])

            await Promise.all([
                prepareSelectableColorTypes({ ID }),
                prepareSelectableEquipmentChapters({ ID }),
                prepareSelectableEquipmentCategories({ ID })
            ])

            await prepareSelectableModelRestrictions({ID})
        }

        const selectColor = async ({ ID, id }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            if (!id)
                throw new ValidationError('CARCONFIGURATION_COLOR_ID_NOT_GIVEN')

            const configuration_ID = ID
            const color_id = id

            const configurationExists = await db.exists(Configurations.drafts, ID)
            if (!configurationExists)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')


            const color = await db.read(SelectableColors, { configuration_ID, color_id }, ['selectable', 'type_code'])
            if (!color)
                throw new ValidationError('CARCONFIGURATION_COLOR_ID_NOT_VALID')

            const { selectable, type_code } = color

            if (!selectable)
                throw new ValidationError('CARCONFIGURATION_COLOR_NOT_SELECTABLE')

            await db.update(SelectableColors, { configuration_ID, type_code }).set({ selected: false })
            await db.update(SelectableColors, { configuration_ID, color_id }).set({ selected: true })
            await db.update(SelectableColorTypes, { configuration_ID, type_code }).set({ selected: true, color_id })

            const colorFields = {
                'E': 'exteriorColor_id',
                'I': 'interiorColor_id',
                'R': 'roofColor_id'
            }

            await db.update(Configurations.drafts, ID).set({
                [colorFields[type_code]]: id
            })

            await checkColorCombinations({ ID })
        }

        const selectEquipment = async ({ ID, id }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            if (!id)
                throw new ValidationError('CARCONFIGURATION_EQUIPMENT_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, ID, ['DraftAdministrativeData_DraftUUID'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { DraftAdministrativeData_DraftUUID } = configuration
            const configuration_ID = ID
            const equipment_id = id

            const equipment = await db.read(SelectableEquipments, { configuration_ID, equipment_id }, ['selectable', 'category_id'])
            if (!equipment)
                throw new ValidationError('CARCONFIGURATION_EQUIPMENT_ID_NOT_VALID')

            const { selectable, category_id } = equipment

            if (!selectable)
                throw new ValidationError('CARCONFIGURATION_EQUIPMENT_NOT_SELECTABLE')

            if (category_id) {
                await db.update(SelectableEquipments, { configuration_ID, category_id }).set({ selectable: false })
                await db.update(SelectableEquipmentCategories, { configuration_ID, category_id }).set({ equipment_id, selected: true })
            }

            await db.update(SelectableEquipments, { configuration_ID, equipment_id }).set({ selected: true, selectable: true })

            await db.create(ConfigurationEquipments.drafts).entries([{
                DraftAdministrativeData_DraftUUID,
                configuration_ID: ID,
                equipment_id: equipment_id
            }])

        }

        const unselectColor = async ({ ID, id }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            if (!id)
                throw new ValidationError('CARCONFIGURATION_COLOR_ID_NOT_GIVEN')

            const configuration_ID = ID
            const color_id = id

            const configurationExists = await db.exists(Configurations.drafts, ID)
            if (!configurationExists)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')


            const color = await db.read(SelectableColors, { configuration_ID, color_id }, ['selected', 'type_code'])
            if (!color)
                throw new ValidationError('CARCONFIGURATION_COLOR_ID_NOT_VALID')

            const { selected, type_code } = color

            if (!selected)
                throw new ValidationError('CARCONFIGURATION_COLOR_NOT_SELECTED')

            await db.update(SelectableColors, { configuration_ID, color_id }).set({ selected: false })
            await db.update(SelectableColorTypes, { configuration_ID, type_code }).set({ selected: false, color_id: null })

            const colorFields = {
                'E': 'exteriorColor_id',
                'I': 'interiorColor_id',
                'R': 'roofColor_id'
            }

            await db.update(Configurations.drafts, ID).set({
                [colorFields[type_code]]: null
            })

            await checkColorCombinations({ ID })
        }

        const unselectEquipment = async ({ ID, id }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            if (!id)
                throw new ValidationError('CARCONFIGURATION_EQUIPMENT_ID_NOT_GIVEN')

            const configuration_ID = ID
            const equipment_id = id

            const configurationExists = await db.exists(Configurations.drafts, ID)
            if (!configurationExists)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const equipment = await db.read(SelectableEquipments, { configuration_ID, equipment_id }, ['selected', 'category_id'])

            const { selected, category_id } = equipment

            if (!equipment)
                throw new ValidationError('CARCONFIGURATION_EQUIPMENT_ID_NOT_VALID')
            if (!selected)
                throw new ValidationError('CARCONFIGURATION_EQUIPMENT_NOT_SELECTED')

            if (category_id) {
                await db.update(SelectableEquipments, { configuration_ID, category_id }).set({ selectable: true })
                await db.update(SelectableEquipmentCategories, { configuration_ID, category_id }).set({ selected: false, equipment_id: null })
            }

            await db.update(SelectableEquipments, { configuration_ID, equipment_id }).set({ selected: false })

            await db.delete(ConfigurationEquipmentsEntity.drafts, { configuration_ID, equipment_id })
        }

        const prepare = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, ID, ['isPrepared'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { isPrepared } = configuration

            if (isPrepared)
                throw new ValidationError('CARCONFIGURATION_ALREADY_PREPARED')

            await db.update(Configurations.drafts, ID).set({ isPrepared: true })

            await Promise.all([
                prepareSelectableModelCategories({ ID }),
                prepareSelectableSalesTypes({ ID })
            ])

            await Promise.all([
                prepareSelectableModels({ ID })
            ])

            await Promise.all([
                prepareSelectableSalesPrices({ ID })
            ])
        }

        const prepareSelectableModelRestrictions = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, ID, ['model_id'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')    

            const { model_id } = configuration
            const configuration_ID = ID

            if (!model_id)
                throw new ValidationError('CARCONFIGURATION_MODEL_NOT_SELECTED')

            await db.delete(SelectableModelRestrictions, { configuration_ID})

            const source = db.read(ModelRestrictions).where({model_id})
            
            await db.create(SelectableModelRestrictions).columns(
                'configuration_ID',
                'modelRestriction_model_id',
                'modelRestriction_id'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'model_id as modelRestriction_model_id',
                'id as modelRestriction_id'
            ))
        }

        const prepareSelectableModelCategories = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, ID, ['brand_code', 'partner_id'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { brand_code, partner_id } = configuration
            const configuration_ID = ID
            const brand_partner_id = partner_id
            const brand_brand_code = brand_code
            const brandContractType_brand_code = brand_code

            await db.delete(SelectableModelCategories, { configuration_ID })

            const brandIsValid = await db.exists(PartnerBrands, { partner_id, brand_code }).where('current_date between validFrom and validTo')
            if (!brandIsValid)
                return

            const contracts = await db.read(PartnerBrandContracts, ['type_code']).where({ brand_partner_id, brand_brand_code })
            if (!contracts?.length)
                return

            const source = db.read(BrandContractTypeModelCategories)
                .where({ brandContractType_brand_code, brandContractType_code: contracts.map(({ type_code }) => type_code) })

            await db.create(SelectableModelCategories).columns(
                'configuration_ID',
                'category_code'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'modelCategory_code as category_code'
            ).groupBy(
                'modelCategory_code'
            ))
        }

        const prepareSelectableSalesTypes = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, ID, ['brand_code', 'salesOrganisation'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { brand_code, salesOrganisation } = configuration
            const configuration_ID = ID

            await db.delete(SelectableSalesTypes, { configuration_ID })

            const source = db.read(SalesTypes)
                .where({ brand_code, salesOrganisation })

            await db.create(SelectableSalesTypes).columns(
                'configuration_ID',
                'salesType_brand_code',
                'salesType_id'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'brand_code as salesType_brand_code',
                'id as salesType_id'
            ))
        }

        const prepareSelectableModels = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, { ID }, ['brand_code', 'isNewConfiguration', 'configuredAt'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { brand_code, isNewConfiguration, configuredAt } = configuration
            const configuration_ID = ID

            await db.delete(SelectableModels, { configuration_ID })

            const modelCategories = await db.read(SelectableModelCategories, ['category_code'])
                .where({ configuration_ID })
                .then(result => result?.map(({ category_code }) => category_code))

            if (!modelCategories?.length)
                return

            const salesTypes = await db.read(SelectableSalesTypes, ['salesType_id'])
                .where({ configuration_ID })
                .then(result => result?.map(({ salesType_id }) => salesType_id))

            if (!salesTypes?.length)
                return

            const source = db.read(Models)
                .where({ brand_code, releasedForPartner: true })
                .where('current_date between validFrom and validTo')
                .where({ category_code: modelCategories })
                .where({ salesType_id: salesTypes })

            if (isNewConfiguration) {
                if (!configuredAt)
                    throw new ValidationError('CARCONFIGURATION_CONFIG_AT_NOT_GIVEN')

                source.where({
                    orderableFrom: { '<=': configuredAt },
                    orderableTo: { '>=': configuredAt }
                })
            }

            await db.create(SelectableModels).columns(
                'configuration_ID',
                'model_id'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'id as model_id'
            ))
        }

        const prepareSelectableSalesPrices = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, ID, ['1'])

            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const configuration_ID = ID

            await db.delete(SelectableModelSalesPrices, { configuration_ID })

            const models = await db.read(SelectableModels, ['model_id'])
                .where({ configuration_ID })
                .then(result => result?.map(({ model_id }) => model_id))

            if (!models?.length)
                return

            const source = db.read(ModelSalesPrices).where({ salesPrice_model_id: models })

            await db.create(SelectableModelSalesPrices).columns(
                'configuration_ID',
                'salesPrice_model_id',
                'salesPrice_validTo'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'model_id as salesPrice_model_id',
                'validTo as salesPrice_validTo'
            ))
        }

        const prepareSelectableColors = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, { ID }, ['model_id', 'isNewConfiguration', 'configuredAt'])
            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { model_id, isNewConfiguration, configuredAt } = configuration
            const configuration_ID = ID

            if (!model_id)
                throw new ValidationError('CARCONFIGURATION_MODEL_NOT_SELECTED')

            await db.delete(SelectableColors, { configuration_ID })

            const source = db.read(ModelColors)
                .where({ model_id })
                .where('current_date between validFrom and validTo')

            if (isNewConfiguration) {
                if (!configuredAt)
                    throw new ValidationError('CARCONFIGURATION_CONFIG_AT_NOT_GIVEN')

                source.where({
                    orderableFrom: { '<=': configuredAt },
                    orderableTo: { '>=': configuredAt }
                })
            }

            await db.create(SelectableColors).columns(
                'configuration_ID',
                'color_id',
                'type_code'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'color_id',
                'type_code'
            ))
        }

        const prepareSelectableColorTypes = async ({ ID }) => {
            const configuration_ID = ID

            await db.delete(SelectableColorTypes, { configuration_ID })

            const source = db.read(SelectableColors).where({ configuration_ID })

            await db.create(SelectableColorTypes).columns(
                'configuration_ID',
                'type_code'
            ).as(source.columns(
                'configuration_ID',
                'type_code'
            ).groupBy(
                'configuration_ID',
                'type_code'
            ))

            let hasSelectableExteriorColors = false
            let hasSelectableInteriorColors = false
            let hasSelectableRoofColors = false

            const colorTypes = await db.read(SelectableColorTypes, ['type_code']).where({ configuration_ID })

            colorTypes.forEach(({ type_code }) => {
                if (type_code === 'E') hasSelectableExteriorColors = true
                if (type_code === 'I') hasSelectableInteriorColors = true
                if (type_code === 'R') hasSelectableRoofColors = true
            })

            await db.update(Configurations.drafts, ID).set({
                hasSelectableExteriorColors,
                hasSelectableInteriorColors,
                hasSelectableRoofColors
            })
        }

        const prepareSelectableColorCombinations = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, { ID }, ['model_id', 'isNewConfiguration', 'configuredAt'])

            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { model_id, isNewConfiguration, configuredAt } = configuration
            const configuration_ID = ID

            if (!model_id)
                throw new ValidationError('CARCONFIGURATION_MODEL_NOT_SELECTED')

            await db.delete(SelectableColorCombinations, { configuration_ID })

            const source = db.read(ModelColorCombinations)
                .where({ model_id })
                .where('current_date between validFrom and validTo')

            if (isNewConfiguration) {
                if (!configuredAt)
                    throw new ValidationError('CARCONFIGURATION_CONFIG_AT_NOT_GIVEN')

                source.where({
                    orderableFrom: { '<=': configuredAt },
                    orderableTo: { '>=': configuredAt }
                })
            }

            await db.create(SelectableColorCombinations).columns(
                'configuration_ID',
                'exterior_id',
                'interior_id',
                'roof_id'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'exterior_id',
                'interior_id',
                'roof_id'
            ))
        }

        const prepareSelectableEquipments = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, { ID }, ['model_id', 'isNewConfiguration', 'configuredAt'])

            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { model_id, isNewConfiguration, configuredAt } = configuration
            const configuration_ID = ID

            if (!model_id)
                throw new ValidationError('CARCONFIGURATION_MODEL_NOT_SELECTED')

            await db.delete(SelectableEquipments, { configuration_ID })

            const source = db.read(ModelEquipments)
                .where({ model_id, isStandard: false, isVisibleInConfigurator: true })
                .where('current_date between validFrom and validTo')

            if (isNewConfiguration) {
                if (!configuredAt)
                    throw new ValidationError('CARCONFIGURATION_CONFIG_AT_NOT_GIVEN')

                source.where({
                    orderableFrom: { '<=': configuredAt },
                    orderableTo: { '>=': configuredAt }
                })
            }

            await db.create(SelectableEquipments).columns(
                'configuration_ID',
                'equipment_id',
                'chapter_brand_code',
                'chapter_id',
                'category_brand_code',
                'category_id'
            ).as(source.columns(
                `'${ID}' as configuration_ID`,
                'equipment_id',
                'chapter_brand_code',
                'chapter_id',
                'category_brand_code',
                'category_id'
            ))
        }

        const prepareSelectableEquipmentChapters = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration_ID = ID

            await db.delete(SelectableEquipmentChapters).where({ configuration_ID })

            const source = db.read(SelectableEquipmentsPrepared)
                .where({ configuration_ID })
                .where('chapter_id is not null')

            await db.create(SelectableEquipmentChapters).columns(
                'configuration_ID',
                'chapter_brand_code',
                'chapter_id'
            ).as(source.columns(
                'configuration_ID',
                'chapter_brand_code',
                'chapter_id'
            ).groupBy(
                'configuration_ID',
                'chapter_brand_code',
                'chapter_id'
            ))

        }

        const prepareSelectableEquipmentCategories = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration_ID = ID

            await db.delete(SelectableEquipmentCategories).where({ configuration_ID })

            const source = db.read(SelectableEquipmentsPrepared)
                .where({ configuration_ID })
                .where('category_id is not null')

            await db.create(SelectableEquipmentCategories).columns(
                'configuration_ID',
                'category_brand_code',
                'category_id'
            ).as(source.columns(
                'configuration_ID',
                'category_brand_code',
                'category_id'
            ).groupBy(
                'configuration_ID',
                'category_brand_code',
                'category_id'
            ))

        }

        const checkColorCombinations = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, { ID }, ['exteriorColor_id', 'interiorColor_id', 'roofColor_id'])

            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_VALID')

            const { exteriorColor_id: exterior_id, interiorColor_id: interior_id, roofColor_id: roof_id } = configuration
            const configuration_ID = ID

            await db.update(SelectableColors, { configuration_ID }).set({ selectable: false })
            await db.update(Configurations.drafts, { ID }).set({ hasValidColorCombination: false })

            const source = db.read(SelectableColorCombinations).where({ configuration_ID })

            if (exterior_id) source.where({ exterior_id })
            if (interior_id) source.where({ interior_id })
            if (roof_id) source.where({ roof_id })

            const combinations = await source

            const colors = {}

            combinations.forEach(({ exterior_id, interior_id, roof_id }) => {
                colors[exterior_id] = true
                colors[interior_id] = true
                colors[roof_id] = true
            })

            await db.update(SelectableColors, { configuration_ID, color_id: Object.keys(colors) }).set({ selectable: true })

            if (combinations?.length === 1 && colors[exterior_id] && colors[interior_id] && colors[roof_id || ''])
                await db.update(Configurations.drafts, { ID }).set({ hasValidColorCombination: true })
        }

        const checkConfigurationSaveable = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations.drafts, { ID }, ['hasValidColorCombination', 'model_id', 'exteriorColor_id', 'interiorColor_id', 'roofColor_id'])

            const { model_id, exteriorColor_id, interiorColor_id, roofColor_id, hasValidColorCombination } = configuration

            if (!model_id)
                throw new ValidationError('CARCONFIGURATION_MODEL_NOT_CONFIGURED')

            if (!exteriorColor_id && !interiorColor_id && !roofColor_id)
                throw new ValidationError('CARCONFIGURATION_COLORS_NOT_CONFIGURED')

            if (!hasValidColorCombination)
                throw new ValidationError('CARCONFIGURATION_COLOR_COMBINATION_NOT_FINISHED')
        }

        const readConfiguration = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('CARCONFIGURATION_CONFIG_ID_NOT_GIVEN')

            const configuration = await db.read(Configurations, ID, config => {
                config.configuredAt, config.model_id, config.exteriorColor_id, config.interiorColor_id, config.roofColor_id, config.equipments(equipment => {
                    equipment.equipment_id
                })
            })

            if (!configuration)
                throw new ValidationError('CARCONFIGURATION_CONFGURATION_NOT_EXISTS')

            const { configuredAt, model_id, exteriorColor_id, interiorColor_id, roofColor_id, equipments } = configuration

            return {
                configuredAt,
                model_id,
                exteriorColor_id,
                interiorColor_id,
                roofColor_id,
                equipments: equipments?.map(({ equipment_id: id }) => id) || []
            }
        }

        return super.init()
    }
}
