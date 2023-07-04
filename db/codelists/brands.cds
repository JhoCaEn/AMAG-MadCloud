namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity Brands : CodeList {
    key code                 : String(4);
        name                 : localized String(30);
        distributionChannel  : String(2);
        organizationDivision : String(2);

        characteristics      : Association to many db.BrandCharacteristics
                                   on characteristics.brand = $self;
        salesTypes           : Association to many db.SalesTypes
                                   on salesTypes.brand = $self;
        bodyTypes            : Association to many db.BodyTypes
                                   on bodyTypes.brand = $self;
        equipmentChapters    : Association to many db.EquipmentChapters
                                   on equipmentChapters.brand = $self;
        modelSeries          : Association to many db.ModelSeries
                                   on modelSeries.brand = $self;
        fuelTypes            : Association to many db.FuelTypes
                                   on fuelTypes.brand = $self;
        driveTypes           : Association to many db.DriveTypes
                                   on driveTypes.brand = $self;
        transmissionTypes    : Association to many db.TransmissionTypes
                                   on transmissionTypes.brand = $self;
        equipmentCategories  : Association to many db.EquipmentCategories
                                   on equipmentCategories.brand = $self;
        colors               : Association to many db.Colors
                                   on colors.brand = $self;
        equipments           : Association to many db.Equipments
                                   on equipments.brand = $self;
        engines              : Association to many db.Engines
                                   on engines.brand = $self;
        transmissions        : Association to many db.Transmissions
                                   on transmissions.brand = $self;
        models               : Association to many db.Models
                                   on models.brand = $self;
};

type Brand : Association to Brands;
