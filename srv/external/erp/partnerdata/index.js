const http = require('@amag-ch/sap_cap_common_http')
const Client = require('./Client')

const clients = {}

/**
 * Connect to an remote datasource.
 * 
 * @param {string} datasource
 * @returns {Promise<Client>}
 */
const connect = async (datasource) => {

    if ( clients[datasource] ) return clients[datasource]

    const connection = await http.connect.to(datasource)

    clients[datasource] = new Client(connection)

    return clients[datasource]
}

module.exports = {
    ...require('./Errors'),
    Client: {
        connect
    }
}