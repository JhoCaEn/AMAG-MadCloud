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

        this.on('createSession', async ({ data } = {}) => createSession(data))

        this.on('prepare', async ({ params: [{ ID } = {}] = [] } = {}) => prepare({ ID }))

        const createSession = async ({ salesPartner_id, brand_code, projectType, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd } = {}) => {

            const entry = {
                salesPartner_id: salesPartner_id,
                brand_code: brand_code,
                projectType_code: projectType,
                customerProjectName: customerProjectName,
                customerProjectNumber: customerProjectNumber,
                fleetProjectNumber: fleetProjectNumber,
                fleetProjectCompanyNumber: fleetProjectCompanyNumber,
                ocd: ocd
            }

            const session = await this.send({
                event: 'CREATE',
                query: db.create(Sessions, entry)
            })

            return session.ID
        }

        const prepare = async ({ ID }) => {
            if (!ID)
                throw new ValidationError('SESSION_ID_NOT_GIVEN')

            const session = await db.read(Sessions, ID)
            if (!session)
                throw new ValidationError('SESSION_ID_NOT_VALID')

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

                await db.update(Sessions, ID).set({ offer_ID , forwardToOffer: true})
            }

        }

        return super.init()
    }
}