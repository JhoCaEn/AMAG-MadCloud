module.exports = class AppSessionsService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('sessions')
        const db = await cds.connect.to('db')

        const {
            Sessions
        } = this.entities

        this.on('createSession', async ({ data: { salesPartner_id, brand_code, projectType, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd } } = {}) => createSession({ salesPartner_id, brand_code, projectType, customerProjectName, customerProjectNumber, fleetProjectNumber, fleetProjectCompanyNumber, ocd }))

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

        return super.init()
    }
}