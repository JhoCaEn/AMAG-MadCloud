module.exports = class ValidationError extends Error {
    /**
     * @param {String} message 
     * @param {Array<any>?} args
     * @param {number?} code
     */
    constructor(message, args, code = 400) {
        super(message)
        this.code = code
        this.numericSeverity = 4
        this.args = args || []
    }
}