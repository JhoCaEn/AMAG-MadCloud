module.exports = async () => {
    const { Client } = require('../../external/erp/masterdata')
    
    return Client.connect('remote-erp-masterdata')
}