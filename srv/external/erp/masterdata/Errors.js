class MasterError extends Error { }
class NotFoundError extends MasterError { }
class ModelNotFound extends NotFoundError { }
class ColorNotFound extends NotFoundError { }
class EngineNotFound extends NotFoundError { }
class BrandCharacteristicNotFound extends NotFoundError { }
class TransmissionNotFound extends NotFoundError { }
class SalesTypeNotFound extends NotFoundError { }
class BodyTypeNotFound extends NotFoundError { }
class ModelSeriesNotFound extends NotFoundError { }
class EquipmentNotFound extends NotFoundError { }
class EquipmentChapterNotFound extends NotFoundError { }
class EquipmentCategoryNotFound extends NotFoundError { }
class DriveTypeNotFound extends NotFoundError { }
class TransmissionTypeNotFound extends NotFoundError { }
class FuelTypeNotFound extends NotFoundError { }

module.exports = {
    Error: MasterError,
    NotFoundError,
    ModelNotFound,
    ColorNotFound,
    EngineNotFound,
    BrandCharacteristicNotFound,
    TransmissionNotFound,
    SalesTypeNotFound,
    BodyTypeNotFound,
    ModelSeriesNotFound,
    EquipmentNotFound,
    EquipmentChapterNotFound,
    EquipmentCategoryNotFound,
    DriveTypeNotFound,
    TransmissionTypeNotFound,
    FuelTypeNotFound
}
