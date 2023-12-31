const LOG = cds.log('erp-vehicle-client')
const { Error, VehicleNotFound } = require('./Errors')

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
     * Get Vehicle data
     * 
     * @param {{erpID: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|VehicleNotFound}
     */
    getVehicle = async ({ ID, $select, $expand }) => {
        if (!ID) throw new Error('No vehicle id provided')

        LOG._debug && LOG.debug('Get vehicle data for', ID)

        const response = await this.#get(`/ZA_VMSVehicle`, {
            params: {
                $filter: `VMSVehicleUUID eq ${ID} and Plant eq '1000' and VMSVehiclePrimaryStatus ne 'L010' and VMSVehicleIsArchived eq false and VMSVehicleIsVisible eq true`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Vehicle data data for', ID, response)

        if (!response?.length)
            throw new VehicleNotFound(`Vehicle ${ID} not found`)

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