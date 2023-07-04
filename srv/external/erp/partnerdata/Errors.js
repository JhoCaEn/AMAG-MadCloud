class PartnerError extends Error {}
class NotFoundError extends PartnerError {}
class PartnerNotFound extends NotFoundError {}
class SalesPartnerNotFound extends NotFoundError {}

module.exports = {
    Error: PartnerError,
    NotFoundError,
    PartnerNotFound,
    SalesPartnerNotFound
}
