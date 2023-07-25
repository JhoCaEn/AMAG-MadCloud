const LOG = cds.log('erp-masterdata-client')
const {
    Error,
    ModelNotFound,
    ColorNotFound,
    EngineNotFound,
    BrandCharacteristicNotFound,
    TransmissionNotFound,
    SalesTypeNotFound,
    BodyTypeNotFound,
    ModelSeriesNotFound,
    EquipmentNotFound,
    EquipmentChapterNotFound,
    EquipmentCategoryNotFound,
    DriveTypeNotFound,
    TransmissionTypeNotFound,
    FuelTypeNotFound,
    OrderControlNotFound
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
     * Get Model data
     * 
     * @param {{id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|ModelNotFound}
     */
    getModel = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No model id provided')

        LOG._debug && LOG.debug('Get model data for', id)

        const response = await this.#get(`/Models`, {
            params: {
                $filter: `Model eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Model data for', id, response)

        if (!response?.length)
            throw new ModelNotFound(`Model ${id} not found`)

        return response[0]
    }

    /**
     * Get Color data
     * 
     * @param {{id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|ColorNotFound}
     */
    getColor = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No color id provided')

        LOG._debug && LOG.debug('Get color data for', id)

        const response = await this.#get(`/Colors`, {
            params: {
                $filter: `Color eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Color data for', id, response)

        if (!response?.length)
            throw new ColorNotFound(`Color ${id} not found`)

        return response[0]
    }

    /**
     * Get Engine data
     * 
     * @param {{id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|EngineNotFound}
     */
    getEngine = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No engine id provided')

        LOG._debug && LOG.debug('Get engine data for', id)

        const response = await this.#get(`/Engines`, {
            params: {
                $filter: `Engine eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Engine data for', id, response)

        if (!response?.length)
            throw new EngineNotFound(`Engine ${id} not found`)

        return response[0]
    }

    /**
     * Get Brand Characteristic data
     * 
     * @param {{brand: String, type: String, $select?: String, $expand?: String}}
     * @returns {Promise<Array>}
     * @throws {Error|BrandCharacteristicNotFound}
     */
    getBrandCharacteristic = async ({ brand, type, $select, $expand }) => {
        if (!brand) throw new Error('No brand provided')
        if (!type) throw new Error('No type provided')

        LOG._debug && LOG.debug('Get characteristic data for', brand, type)

        const response = await this.#get(`/BrandCharacteristics`, {
            params: {
                $filter: `Brand eq '${brand}' and Type eq '${type}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Characteristic data for', brand, type, response)

        if (!response?.length)
            throw new BrandCharacteristicNotFound(`Characteristic ${brand}/${type} not found`)

        return response[0]
    }

    /**
     * Get Transmission data
     * 
     * @param {{id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|TransmissionNotFound}
     */
    getTransmission = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No transmission id provided')

        LOG._debug && LOG.debug('Get transmission data for', id)

        const response = await this.#get(`/Transmissions`, {
            params: {
                $filter: `Transmission eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Transmission data for', id, response)

        if (!response?.length)
            throw new TransmissionNotFound(`Transmission ${id} not found`)

        return response[0]
    }

    /**
     * Get Sales Type data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|SalesTypeNotFound}
     */
    getSalesType = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No sales type brand provided')
        if (!id) throw new Error('No sales type id provided')

        LOG._debug && LOG.debug('Get sales type data for', brand, id)

        const response = await this.#get(`/SalesTypes`, {
            params: {
                $filter: `Brand eq '${brand}' and Type eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Sales type data for', brand, id, response)

        if (!response?.length)
            throw new SalesTypeNotFound(`Sales type ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Body Type data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|BodyTypeNotFound}
     */
    getBodyType = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No body type brand provided')
        if (!id) throw new Error('No body type id provided')

        LOG._debug && LOG.debug('Get body type data for', brand, id)

        const response = await this.#get(`/BodyTypes`, {
            params: {
                $filter: `Brand eq '${brand}' and Type eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Body type data for', brand, id, response)

        if (!response?.length)
            throw new BodyTypeNotFound(`Body type ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Model Series data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|ModelSeriesNotFound}
     */
    getModelSeries = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No model series brand provided')
        if (!id) throw new Error('No model series id provided')

        LOG._debug && LOG.debug('Get model series data for', brand, id)

        const response = await this.#get(`/ModelSeries`, {
            params: {
                $filter: `Brand eq '${brand}' and ModelSeries eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Model series data for', brand, id, response)

        if (!response?.length)
            throw new ModelSeriesNotFound(`Model series ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Equipment data
     * 
     * @param {{id: String, $select?. String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|EquipmentNotFound}
     */
    getEquipment = async ({ id, $select, $expand }) => {
        if (!id) throw new Error('No equipment id provided')

        LOG._debug && LOG.debug('Get equipment data for', id)

        const response = await this.#get(`/Equipments`, {
            params: {
                $filter: `Equipment eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Equipment data for', id, response)

        if (!response?.length)
            throw new EquipmentNotFound(`Equipment ${id} not found`)

        return response[0]
    }


    /**
     * Get Equipment Chapter data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|EquipmentChapterNotFound}
     */
    getEquipmentChapter = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No equipment chapter brand provided')
        if (!id) throw new Error('No equipment chapter id provided')

        LOG._debug && LOG.debug('Get equipment chapter data for', brand, id)

        const response = await this.#get(`/EquipmentChapters`, {
            params: {
                $filter: `Brand eq '${brand}' and Chapter eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Equipment chapter data for', brand, id, response)

        if (!response?.length)
            throw new EquipmentChapterNotFound(`Equipment chapter ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Equipment Category data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|EquipmentCategoryNotFound}
     */
    getEquipmentCategory = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No equipment category brand provided')
        if (!id) throw new Error('No equipment category id provided')

        LOG._debug && LOG.debug('Get equipment category data for', brand, id)

        const response = await this.#get(`/EquipmentCategories`, {
            params: {
                $filter: `Brand eq '${brand}' and Category eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Equipment category data for', brand, id, response)

        if (!response?.length)
            throw new EquipmentCategoryNotFound(`Equipment category ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Drive Type data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|DriveTypeNotFound}
     */
    getDriveType = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No drive type brand provided')
        if (!id) throw new Error('No drive type id provided')

        LOG._debug && LOG.debug('Get drive type data for', brand, id)

        const response = await this.#get(`/DriveTypes`, {
            params: {
                $filter: `Brand eq '${brand}' and Type eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Drive type data for', brand, id, response)

        if (!response?.length)
            throw new DriveTypeNotFound(`Drive type ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Transmission Type data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|TransmissionTypeNotFound}
     */
    getTransmissionType = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No transmission type brand provided')
        if (!id) throw new Error('No transmission type id provided')

        LOG._debug && LOG.debug('Get transmission type data for', brand, id)

        const response = await this.#get(`/TransmissionTypes`, {
            params: {
                $filter: `Brand eq '${brand}' and Type eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Transmission type data for', brand, id, response)

        if (!response?.length)
            throw new TransmissionTypeNotFound(`Transmission type ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Fuel Type data
     * 
     * @param {{brand: String, id: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|FuelTypeNotFound}
     */
    getFuelType = async ({ brand, id, $select, $expand }) => {
        if (!brand) throw new Error('No fuel type brand provided')
        if (!id) throw new Error('No fuel type id provided')

        LOG._debug && LOG.debug('Get fuel type data for', brand, id)

        const response = await this.#get(`/FuelTypes`, {
            params: {
                $filter: `Brand eq '${brand}' and Type eq '${id}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Fuel type data for', brand, id, response)

        if (!response?.length)
            throw new FuelTypeNotFound(`Fuel type ${brand}/${id} not found`)

        return response[0]
    }

    /**
     * Get Order Controls data
     * 
     * @param {{vehicleUsage: String, customerState: String, endCustomerState: String, $select?: String, $expand?: String}}
     * @returns {Promise<Object>}
     * @throws {Error|OrderControlNotFound}
     */
    getOrderControl = async ({ vehicleUsage, customerState, endCustomerState, $select, $expand }) => {
        if (!vehicleUsage) throw new Error('No vehicle usage provided')
        if (!customerState) throw new Error('No customer state provided')
        if (!endCustomerState) throw new Error('No end customer state provided')

        LOG._debug && LOG.debug('Get order dontrol data for', vehicleUsage, customerState, endCustomerState)

        const response = await this.#get(`/OrderControls`, {
            params: {
                $filter: `VehicleUsage eq '${vehicleUsage}' and CustomerStatus eq '${customerState}' and EndCustomerStatus eq '${endCustomerState}'`,
                $top: 1,
                $select,
                $expand
            }
        })

        LOG._debug && LOG.debug('Order control data for', vehicleUsage, customerState, endCustomerState, response)

        if (!response?.length)
            throw new OrderControlNotFound(`Order Control ${vehicleUsage}/${customerState}/${endCustomerState} not found`)

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