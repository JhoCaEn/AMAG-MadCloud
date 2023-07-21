module.exports = class AppCallbacksService extends cds.ApplicationService {
    async init() {

        const LOG = cds.log('callbacks')
        const db = await cds.connect.to('db')
        const { ValidationError } = require('../../lib/errors')

        const {
            Callbacks
        } = this.entities

        const {
            CallbackSemantics
        } = db.entities('retail.dwb')

        this.on('createCallback', async ({ data } = {}) => createCallback(data))
        this.before('SAVE', Callbacks, async ({ data: { ID } = {} } = {}) => checkCallbackSaveable(ID))

        const createCallback = async ({ semantic, parameters } = {}) => {
            LOG._debug && LOG.debug('semantic', semantic)
            LOG._debug && LOG.debug('parameters', parameters)

            if (semantic) {
                const exists = await db.exists(CallbackSemantics, { code: semantic })

                if (!exists)
                    throw new ValidationError('CALLBACK_NO_VALID_PARAMETERS')
            }

            if (parameters)
                checkParameters(parameters)

            const callback = await this.send({
                event: 'CREATE',
                query: db.create(Callbacks, {
                    semantic_code: semantic,
                    parameters
                })
            })

            const { ID } = callback

            return ID
        }

        const checkCallbackSaveable = async (ID) => {
            const callback = await db.read(Callbacks.drafts, ID, ['parameters'])

            if (!callback) return

            checkParameters(callback?.parameters)
        }

        const checkParameters = (parameters) => {
            try {
                JSON.parse(parameters)
            } catch (err) {
                LOG._debug && LOG.debug('Parameters parse error', err.message)
                throw new ValidationError('CALLBACK_NO_VALID_PARAMETERS')
            }
        }

        return super.init()
    }
}
