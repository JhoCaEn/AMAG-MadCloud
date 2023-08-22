module.exports = async () => {
    const { Client } = require('../../external/erp/vehicles')
    
    return Client.connect('remote-erp-vehicles')
}