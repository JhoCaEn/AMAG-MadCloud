class VehicleError extends Error { }
class NotFoundError extends VehicleError { }
class VehicleNotFound extends NotFoundError { }

module.exports = {
    Error: VehicleError,
    NotFoundError,
    VehicleNotFound
}
