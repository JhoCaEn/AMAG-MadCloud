class VehicleNotFound extends Error {}
class NotFoundError extends VehicleNotFound {}

module.exports = {
    Error: VehicleNotFound,
    NotFoundError
}
