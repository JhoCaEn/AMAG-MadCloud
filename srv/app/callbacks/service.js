module.exports = class AppCallbacksService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('callbacks')
        const db = await cds.connect.to('db')
        const { ValidationError } = require('../../lib/errors')

        const {
            Callbacks,
            CallbackSemantics
        } = this.entities

        this.on('createCallback', async ({ data } = {}) => createCallback(data))
        this.before('SAVE', Callbacks, async ({ data } = {}) => checkCallbackSaveable(data))
        this.before('DELETE', Callbacks, async({data} = {}) => deleteCallback(data))

        const createCallback = async ({ semantic: semantic_code, parameters } = {}) => {
            LOG._debug && LOG.debug('semantic', semantic)
            LOG._debug && LOG.debug('parameters', parameters)

            const callback = await this.send({ event: 'CREATE', query: db.create(Callbacks, { semantic_code, parameters }) })

            return callback.ID
        }

        const checkCallbackSaveable = async ({ semantic_code, parameters }) => {
            if (semantic_code) {
                const exists = await db.exists(CallbackSemantics, { code: semantic_code })

                if (!exists)
                    throw new ValidationError('CALLBACK_SEMANTIC_NOT_EXISTS', [semantic_code])
            }

            if (parameters)
                try {
                    JSON.parse(parameters)
                } catch (err) {
                    LOG._debug && LOG.debug('Parameters parse error', err.message)
                    throw new ValidationError('CALLBACK_NO_VALID_PARAMETERS', [err.message])
                }
        }

        const deleteCallback = async ({ID}) => {
                this.emit("callback/deleted", {ID})
        }

        return super.init()
    }
}
