module.exports = class AppSessionsService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('sessions')
        const db = await cds.connect.to('db')

        const { ValidationError } = require('../../lib/errors')

        const callbackService = await cds.connect.to('AppCallbacksService')
        const offerService = await cds.connect.to('AppOffersService')


        const {
            Sessions
        } = this.entities

        this.on('createSession', async ({ data: { salesPartner_id, brand_code, projectType, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd } } = {}) => createSession({ salesPartner_id, brand_code, projectType, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd }))

        this.on('prepare', async ({ params: [{ ID } = {}] = [] } = {}) => prepare({ ID }))

        const createSession = async ({ salesPartner_id, brand_code, projectType, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd } = {}) => {
            const sessionId = cds.utils.uuid()

            const entry = {
                ID: sessionId,
                salesPartner_id: salesPartner_id || null,
                brand_code: brand_code || null,
                projectType_code: projectType || null,
                customerProjectName: customerProjectName || null,
                customerProjectNumber: customerProjectNumber || null,
                fleetProjectNumber: fleetProjectNumber || null,
                fleetProjectCompanyNumber: fleetProjectCompanyNumber || null,
                ocd: ocd || null
            }

            await db.create(Sessions, entry)

            return sessionId
        }

        const prepare = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('SESSION_ID_NOT_GIVEN')

            const session = await db.read(Sessions, ID)
            if (!session)
                throw new ValidationError('SESSION_ID_NOT_VALID')

            const { isPrepared, ocd, salesPartner_id, brand_code, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber } = session

            if (isPrepared)
                throw new ValidationError('SESSION_ALREADY_PREPARED')

            await db.update(Sessions, ID).set({ isPrepared: true })

            const callbackSemantic = 'session-display'
            const callbackParameters = {
                "ID": ID,
                "done": true
            }

            const callback_ID = await callbackService.send('createCallback', {
                callbackSemantic,
                callbackParameters
            })

            if (ocd) {
                const offer_ID = await offerService.send('createOffer', {
                    salesPartner_id,
                    brand_code,
                    customerProjectName,
                    customerProjectNumber,
                    fleetProjectNumber,
                    fleetProjectCompanyNumber,
                    callback_ID
                })

                const forwardToOffer = true

                await db.update(Sessions, ID).set({ offer_ID , forwardToOffer})
            }

        }

        return super.init()
    }
}