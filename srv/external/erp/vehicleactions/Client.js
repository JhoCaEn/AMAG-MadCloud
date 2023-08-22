const LOG = cds.log('erp-vehicleactions-client')
const {
    Error,
    NotFoundError,
    VehicleNotFound
} = require('./Errors')

module.exports = class Client {

    /**
     * @type {Proxy}
     */
    #connection = null

    /**
     * @param {HTTPClient} connection 
     */
    constructor(connection) {
        this.#connection = new Proxy(connection)

    }

    /**
     * Create Vehicle
     * 
     * @param {payload: Object}
     * @returns {Promise<Object>}
     * @throws {Error}
     */
    createVehicle = async (payload) => {
        if (!payload || !Object.keys(payload).length)
            throw new Error('No payload provided')

        LOG._debug && LOG.debug('Create vehicle', payload)

        const headers = await this.#head(`/`, {
            headers: {
                'x-csrf-token': 'Fetch',
                'Accept': 'text/html'
            }
        })

        const response = await this.#post(`/createVehicle`, payload, { headers })

        LOG._debug && LOG.debug('Create vehicle - response for ID', payload.DWBKey, response)

        return response.d.VMSVehicleUUID
    }

    /**
     * @param {string} path
     * @param {Object} payload 
     * @param {Object=} config 
     * @returns {Promise<any>}
     * @throws {Error}
     */
    async #post(path, payload, config) {
        return this.#connection.post(path, payload, config)
    }

    /**
     * @param {string} path
     * @param {Object} options 
     * @returns {Promise<any>}
     * @throws {Error}
     */
    async #head(path, options) {
        return this.#connection.head(path, options)
    }
}

class Proxy {

    /** @type {HTTPClient} */
    #connection

    /**
     * @param {HTTPClient} connection 
     */
    constructor(connection) {
        this.#connection = connection

        require('axios').interceptors.response.use(this.#onResponse.bind(this), this.#onError.bind(this))
    }

    /**
     * 
     * @param {string} path
     * @param {Object} payload 
     * @param {Object=} config 
     * @returns {Promise<any>}
     */
    async post(path, payload, config) {
        return this.#connection.post(path, payload, config).catch(this.#convertError)
    }

    /**
     * 
     * @param {string} path
     * @param {Object} options 
     * @returns {Promise<any>}
     */
    async head(path, options) {
        return this.#connection.head(path, options).catch(this.#convertError)
    }

    #onResponse(response) {
        if (response?.headers?.['x-csrf-token']) {
            response.data = {
                'x-csrf-token': response.headers['x-csrf-token'],
                cookie: response.headers['set-cookie']
            }
        }

        return response
    }

    #onError(error) {
        return Promise.reject(error)
    }

    #convertError(err) {

        let message = err.message
        let response = err.innererror?.response

        if (response?.data?.error?.message)
            message = response.data.error.message

        if (response?.data?.error?.message?.value)
            message = response.data.error.message.value

        if (response?.data)
            LOG.warn('Error response', response.data)

        throw new Error(message || 'ERP Error', { cause: err })
    }
}