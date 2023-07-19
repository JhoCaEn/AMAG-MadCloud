module.exports = class AppCallbacksService extends cds.ApplicationService {
    async init() {
        const LOG = cds.log('callbacks')
        const db = await cds.connect.to('db')

        const {
            Callbacks
        } = this.entities

        this.on('createCallback', async ({ data: { semantic, parameters } } = {}) => createCallback({ semantic, parameters }))

        const createCallback = async ({ semantic, parameters } = {}) => {
            const callbackId = cds.utils.uuid()

            LOG._debug && LOG.debug('ID', callbackId)
            LOG._debug && LOG.debug('semantic', semantic)
            LOG._debug && LOG.debug('parameters', parameters)

            const entry = {
                ID: callbackId,
                semantic_code: semantic || null,
                parameters: parameters || null
            }

            await db.create(Callbacks, entry)

            return callbackId
        }

        return super.init()
    }
}
