module.exports = (brand, codes) => {
    const transformed = [{
        type_brand_code: brand,
        type_code: ''
    }]

    if (codes)
        Array.isArray(codes) ?
            codes.forEach(code => transformed.push({
                type_brand_code: brand,
                type_code: code
            })) :
            transformed.push({
                type_brand_code: brand,
                type_code: codes
            })

    return transformed
}