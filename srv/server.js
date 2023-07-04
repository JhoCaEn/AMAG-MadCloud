const cds = require('@sap/cds')

// Increase package size to avoid error "error while parsing protocol: invalid communication buffer structure"
require('hdb/lib/protocol/common/Constants').MAX_PACKET_SIZE = Math.pow(2,18)

cds.on('bootstrap', app => {
    app.get('/health', (_, res) => {
        res.status(200).send('OK')
    })
})

if (process.env.NODE_ENV !== 'production') {
    cds.once('bootstrap', () => new (require('@amag-ch/sap_cap_common_launchpad'))({ version: '1.114.0' }))
}

module.exports = cds.server
