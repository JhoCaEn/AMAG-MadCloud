module.exports = async () => {
    const { Client } = require('../../external/erp/partnerdata')
    
    return Client.connect('remote-erp-partnerdata')
}