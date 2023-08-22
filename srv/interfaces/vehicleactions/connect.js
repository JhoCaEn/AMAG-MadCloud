module.exports = async () => {
    const { Client } = require('../../external/erp/vehicleactions')
    
    return Client.connect('remote-erp-vehicleactions')
}