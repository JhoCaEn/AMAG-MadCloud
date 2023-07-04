const LOG = cds.log('erp-partnerdata-client')
const { Error, PartnerNotFound, SalesPartnerNotFound } = require('./Errors')

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
     * Get Partner data
     * 
     * @param {{id: String|Number, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|PartnerNotFound}
     */
    getPartner = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No partner id provided')

        LOG._debug && LOG.debug('Get partner data for', id)

        const response = await this.#get(`/Partners`, {
            params: {
                $filter: `Partner eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Partner data for', id, response)

        if (!response?.length)
            throw new PartnerNotFound(`Partner ${id} not found`)

        return response[0]
    }

    /**
     * Get Sales Partner data
     * 
     * @param {{id: String|Number, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|SalesPartnerNotFound}
     */
    getSalesPartner = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No sales partner id provided')

        LOG._debug && LOG.debug('Get sales partner data for', id)

        const response = await this.#get(`/SalesPartners`, {
            params: {
                $filter: `Partner eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Sales partner data for', id, response)

        if (!response?.length)
            throw new SalesPartnerNotFound(`Sales partner ${id} not found`)

        return response[0]
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
        options = options ?? {}
        options.params = options.params ?? {}
        options.headers = options.headers ?? {}

        options.params.$format = 'json'
        options.params['sap-language'] = 'en'

        if (!options.params.$select) delete options.params.$select
        if (!options.params.$expand) delete options.params.$expand

        options.headers['accept'] = 'application/json'
        options.headers['accept-language'] = 'de'

        return this.#connection.get(path, options).catch(this.#convertError)
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