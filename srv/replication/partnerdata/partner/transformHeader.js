module.exports = (raw) => ({
    id: raw.Partner,
    name: transformName(raw.Name1, raw.Name2) || null
})

const transformName = (name1, name2) => name1 && name2 && /^amag/i.test(name1) ? name2 : name1