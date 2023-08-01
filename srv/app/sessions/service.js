module.exports = class AppSessionsService extends cds.ApplicationService {
    async init() {

        const db = await cds.connect.to('db')

        const { ValidationError } = require('../../lib/errors')

        const callbackService = await cds.connect.to('AppCallbacksService')
        const offerService = await cds.connect.to('AppOffersService')

        const {
            Sessions
        } = this.entities

        this.on('createSession', async ({ data } = {}) => createSession(data))
        this.on('prepare', async ({ params: [{ ID } = {}] = [], data: { callbackURL } = {} } = {}) => prepare({ ID , callbackURL }))

        const createSession = async ({ salesPartner_id, brand_code, projectType_code, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd } = {}) => {

            const session = await this.create(Sessions, {
                salesPartner_id,
                brand_code,
                projectType_code,
                customerProjectName,
                customerProjectNumber,
                fleetProjectNumber,
                fleetProjectCompanyNumber,
                ocd
            })

            return session.ID
        }

        const prepare = async ({ ID , callbackURL }) => {
            if (!ID)
                throw new ValidationError('SESSION_ID_NOT_GIVEN')

            const session = await db.read(Sessions, ID)
            if (!session)
                throw new ValidationError('SESSION_ID_NOT_VALID', [ID])

            const { isPrepared, ocd, salesPartner_id, brand_code, customerProjectName, projectType_code, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber } = session

            if (isPrepared)
                throw new ValidationError('SESSION_ALREADY_PREPARED')

            await db.update(Sessions, ID).set({ isPrepared: true })

            const callback_ID = await callbackService.send('createCallback', {
                semantic: 'session-display',
                parameters: JSON.stringify({
                    ID,
                    done: true
                })
            })

            if (!ocd) {
                const offer_ID = await offerService.send('createOffer', {
                    salesPartner_id,
                    brand_code,
                    customerProjectName,
                    projectType_code,
                    customerProjectNumber,
                    fleetProjectNumber,
                    fleetProjectCompanyNumber,
                    callback_ID
                })

                await db.update(Sessions, ID).set({ offer_ID, forwardToOffer: true })
            }

        }

        return super.init()
    }
}