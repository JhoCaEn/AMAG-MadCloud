module.exports = class AppOrderReleasesService extends cds.ApplicationService {
    async init() {

        const db = await cds.connect.to('db')
        const { ValidationError } = require('../../lib/errors')

        const {
            OrderReleases
        } = this.entities

        this.on('approveOrder', async ({ params } = {}) => approve({ params }))
        this.on('rejectOrder', async ({ params } = {}) => reject({ params }))

        const approve = async ({ params }) => {
            const ID = params?.[0]

            if (!ID)
                throw new ValidationError('ORDER_ID_NOT_GIVEN')

            await db.update(OrderReleases, { ID }).set({ orderReleased: true })
        }

        const reject = async ({ params }) => {
            const ID = params?.[0]
            
            if (!ID)
                throw new ValidationError('ORDER_ID_NOT_GIVEN')

            await db.update(OrderReleases, { ID }).set({ orderCreated: false })
        }

        return super.init()
    }
}