module.exports = (() => {
    let brands = null

    const init = async () => {
        const db = await cds.connect.to('db')
        const { Brands } = db.entities('retail.dwb')

        brands = await db.read(Brands, ['code']).then(result => 
            result?.reduce((current, { code }) => ({ 
                ...current, 
                [code]: true 
            }), {}) || {}
        )
    }

    return {
        exists: async (code) => {
            if (!brands) await init()

            return !!brands[code]
        }
    }
})()