module.exports = class AppOffersService extends cds.ApplicationService {
    async init() {

        const db = await cds.connect.to('db')
        const carConfiguratorService = await cds.connect.to('AppCarConfiguratorService')
        const callbackService = await cds.connect.to('AppCallbacksService')

        const { ValidationError } = require('../../lib/errors')

        const {
            Offers,
            CarConfigurationEquipments,
            SalesPartners
        } = this.entities

        const {
            PartnerBrands,
            OfferSelectableBrands: SelectableBrands
        } = db.entities('retail.dwb')

        this.on('copy', async ({ params: [{ ID } = {}] = [] } = {}) => copy({ ID }))
        this.on('selectSalesPartner', async ({ params: [{ ID } = {}] = [], data: { id } = {} } = {}) => selectSalesPartner({ ID, id }))
        this.on('selectBrand', async ({ params: [{ ID } = {}] = [], data: { code } = {} } = {}) => selectBrand({ ID, code }))
        this.on('createCarConfiguration', async ({ params: [{ ID } = {}] = [] } = {}) => createCarConfiguration({ ID }))
        this.on('finishCarConfiguration', async ({ params: [{ ID } = {}] = [] } = {}) => finishCarConfiguration({ ID }))
        this.on('createOffer', async ({ data: { salesPartner_id, brand_code, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, callback_ID } } = {}) => createOffer({ salesPartner_id, brand_code, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, callback_ID }))

        this.before('CREATE', Offers, async ({ data: { ID } = {} } = {}) => checkOfferSaveable(ID))
        this.on('CREATE', Offers, async (req, next) => save(req, next))

        this.before('NEW', CarConfigurationEquipments, async (req) => {
            req.data.equipment_id = 'PR001852'
        })

        const createOffer = async ({ salesPartner_id, brand_code, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, callback_ID } = {}) => {
            const offerId = cds.utils.uuid()

            const entry = {
                ID: offerId,
                salesPartner_id: salesPartner_id || null,
                brand_code: brand_code || null,
                customerProjectName: customerProjectName || null,
                customerProjectNumber: customerProjectNumber || null,
                fleetProjectNumber: fleetProjectNumber || null,
                fleetProjectCompanyNumber: fleetProjectCompanyNumber || null,
                callback_ID: callback_ID || null
            }

            await db.create(Offers, entry)

            return offerId
        }

        const copy = async ({ ID: sourceID } = {}) => {

            const sourceOffer = await db.read(Offers, sourceID, ['salesPartner_id', 'brand_code'])

            if (!sourceOffer)
                throw new ValidationError('OFFERS_NOT_FOUND')

            const offer = await this.send({
                event: 'NEW',
                query: db.create(Offers, sourceOffer)
            })

            const { ID, salesPartner_id, brand_code } = offer

            if (salesPartner_id)
                await selectSalesPartner({ ID, salesPartner_id }, true)

            if (brand_code)
                await selectBrand({ ID, brand_code })

            return offer
        }

        const createCarConfiguration = async ({ ID } = {}) => {

            const offer = await db.read(Offers.drafts, ID, offer => {
                offer.salesPartner_id, offer.brand_code, offer.carConfigurationModel_id, offer.carConfigurationExteriorColor_id, offer.carConfigurationInteriorColor_id, offer.carConfigurationRoofColor_id, offer.carConfigurationEquipments(equipment => {
                    equipment.equipment_id
                })
            })

            if (!offer)
                throw new ValidationError('OFFERS_DRAFT_NOT_FOUND')

            const { salesPartner_id: partner_id, brand_code, carConfigurationModel_id: model_id, carConfigurationExteriorColor_id: exteriorColor_id, carConfigurationInteriorColor_id: interiorColor_id, carConfigurationRoofColor_id: roofColor_id, carConfigurationEquipments: equipments } = offer

            if (!partner_id)
                throw new ValidationError('OFFERS_NO_SALES_PARTNER')

            if (!brand_code)
                throw new ValidationError('OFFERS_NO_BRAND')

            const callbackParamsPayload = {
                "ID": ID,
                "carConfigurationDone": true
            }
    
            const callback_ID = await callbackService.send('createCallback', {
                semantic : 'offer-manage',
                parameters: JSON.stringify(callbackParamsPayload)
            })
    

            const carConfigurationID= await carConfiguratorService.send('createConfiguration', {
                partner_id,
                brand_code,
                salesOrganisation: '1000',
                isNewConfiguration: true,
                model_id,
                exteriorColor_id,
                interiorColor_id,
                roofColor_id,
                callback_ID,
                equipments: equipments?.map(({ equipment_id }) => equipment_id) || []
            })


            await db.update(Offers.drafts, ID).set({ carConfigurationID, callback_ID })

            return callback_ID
        }

        const save = async (req, next) => {
            req.data.ocd = await getNextOCDNumber()

            const result = await next()

            await db.delete(SelectableBrands).where({ offer_ID: req.data.ID })

            return result
        }

        const getNextOCDNumber = async () => {
            const maxOCD = await db.read(Offers, ['max(ocd) as max']).then(result => result?.[0]?.max || 0)

            return maxOCD + 1
        }

        const checkOfferSaveable = async (ID) => {
            const offer = await db.read(Offers.drafts, ID, ['carConfigurationIsValid'])

            if (!offer?.carConfigurationIsValid)
                throw new ValidationError('OFFERS_NO_VALID_CAR_CONFIGURATION')
        }

        const selectBrand = async ({ ID, code: brand_code } = {}) => {

            if (!brand_code)
                throw new ValidationError('OFFERS_BRAND_NOT_GIVEN')

            if (!await db.exists(SelectableBrands, { offer_ID: ID, brand_code }))
                throw new ValidationError('OFFERS_BRAND_NOT_EXISTS', [brand_code])

            const currentBrand_code = await db.read(Offers.drafts, { ID }, ['brand_code']).then(offer => offer?.brand_code)

            if (currentBrand_code === brand_code)
                return

            if (currentBrand_code)
                throw new ValidationError('OFFERS_BRAND_ALREADY_ASSIGNED')

            return db.update(Offers.drafts, ID).set({ brand_code })
        }

        const selectSalesPartner = async ({ ID, id: salesPartner_id }, isCopy = false) => {

            if (!salesPartner_id)
                throw new ValidationError('OFFERS_SALESPARTNER_NOT_GIVEN')

            if (!await db.exists(SalesPartners, { id: salesPartner_id }))
                throw new ValidationError('OFFERS_SALESPARTNER_NOT_EXISTS', [salesPartner_id])

            const currentSalesPartnerId = await db.read(Offers.drafts, { ID }, ['salesPartner_id']).then(offer => offer?.salesPartner_id)

            if (!isCopy && currentSalesPartnerId === salesPartner_id)
                return

            if (!isCopy && currentSalesPartnerId)
                throw new ValidationError('OFFERS_SALESPARTNER_ALREADY_ASSIGNED')

            const offer_ID = ID
            const partner_id = salesPartner_id

            await db.update(Offers.drafts, { ID }).set({ salesPartner_id, hasSalesPartner: true, brand_code: null })
            await db.delete(SelectableBrands).where({ offer_ID })

            const source = db.read(PartnerBrands)
                .where({ partner_id })
                .where('current_date between validFrom and validTo')

            await db.create(SelectableBrands).columns(
                'offer_ID',
                'brand_code'
            ).as(source.columns(
                `'${ID}' as offer_ID`,
                'brand_code'
            ))

            const countBrands = await db.read(SelectableBrands, { offer_ID }, ['count(*) as count'])
                .then(result => result?.count || 0)

            if (!countBrands)
                throw new ValidationError('OFFERS_SALESPARTNER_NO_BRANDS', [salesPartner_id])

            if (countBrands === 1) {
                const brand_code = await db.read(SelectableBrands, { offer_ID: ID }, ['brand_code'])
                    .then(result => result?.brand_code)

                await selectBrand({ ID, code: brand_code })
            }
        }

        const finishCarConfiguration = async ({ ID: ID } = {}) => {
            if (!ID)
                throw new ValidationError('OFFERS_OFFER_ID_NOT_GIVEN')

            const offer = await db.read(Offers.drafts, ID, ['carConfigurationID', 'DraftAdministrativeData_DraftUUID'])

            if (!offer)
                throw new ValidationError('OFFERS_DRAFT_NOT_FOUND')

            const { carConfigurationID, DraftAdministrativeData_DraftUUID } = offer

            if (!offer.carConfigurationID)
                throw new ValidationError('OFFERS_NO_VALID_CAR_CONFIGURATION')

            const carConfiguration = await carConfiguratorService.send('readConfiguration', {
                ID: carConfigurationID
            })

            await db.update(Offers.drafts, ID).set({
                carConfigurationConfiguredAt: carConfiguration.configuredAt,
                carConfigurationModel_id: carConfiguration.model_id,
                carConfigurationExteriorColor_id: carConfiguration.exteriorColor_id,
                carConfigurationInteriorColor_id: carConfiguration.interiorColor_id,
                carConfigurationRoofColor_id: carConfiguration.roofColor_id,
                carConfigurationEquipments: carConfiguration.equipments?.map(id => ({
                    offer_ID: ID,
                    equipment_id: id,
                    DraftAdministrativeData_DraftUUID,
                    IsActiveEntity: false,
                    HasActiveEntity: false,
                    HasDraftEntity: false
                })) || [],
                carConfigurationIsValid: true
            })
        }

        return super.init()
    }
}
