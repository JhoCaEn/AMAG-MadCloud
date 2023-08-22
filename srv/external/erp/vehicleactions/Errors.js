class VehicleActionsError extends Error {}
class NotFoundError extends VehicleActionsError { }
class VehicleNotFound extends NotFoundError { }

module.exports = {
    Error: VehicleActionsError,
    NotFoundError,
    VehicleNotFound
}
