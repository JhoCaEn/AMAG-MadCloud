const LOG = cds.log('erp-forms-client')
const { Error } = require('./Errors')

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
     * @param {string} path
     * @param {Object} options 
     * @returns {Promise<any>}
     * @throws {Error}
     */
    async #get(path, options) {
        return this.#connection.get(path, options)
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
}

class Proxy {

    /** @type {HTTPClient} */
    #connection

    /**
     * @param {HTTPClient} connection 
     */
    constructor(connection) {
        this.#connection = connection
    }

    /**
     * 
     * @param {string} path
     * @param {Object} options 
     * @returns {Promise<any>}
     */
    async get(path, options) {
        return await this.#connection.get(path, options).catch(this.#convertError)
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

    #convertError(err) {

        let message = err.message
        let response = err.innererror?.response

        if (response?.data?.error?.message)
            message = response.data.error.message

        if (response?.data)
            LOG.warn('Error response', response.data)

        switch (response?.status) {
            default: throw new Error(message || 'ERP Error', { cause: err })
        }
    }
}