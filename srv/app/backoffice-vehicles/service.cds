using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/vehicles'
service AppBackofficeVehiclesService {

    @readonly
    entity Vehicles              as projection on db.Vehicles {
        ID,
        erpID,
        salesOrganisation,
        distributionChannel,
        organizationDivision,
        material,
        plant,
        salesPartner,
        dealerPartner,
        soldToPartner,
        shipToPartner,
        billToPartner,
        paidByPartner,
        brand,
        salesType @cds.api.ignore,
        salesType.id as salesTypeId,
        model,
        usage,
        customerState,
        endCustomerState,
        availability,
        exteriorColor,
        exteriorColorSalesPriceConstraintEquipment,
        exteriorColorSalesPriceConstraintColor,
        interiorColor,
        interiorColorSalesPriceConstraintEquipment,
        interiorColorSalesPriceConstraintColor,
        roofColor,
        roofColorSalesPriceConstraintEquipment,
        roofColorSalesPriceConstraintColor,
        exteriorColorSalesPrice,
        interiorColorSalesPrice,
        roofColorSalesPrice,
        createdAt,
        modifiedAt,
        equipments
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity Partners              as projection on db.Partners {
        id,
        name
    }

    @readonly
    entity Brands                as projection on db.Brands {
        code,
        name
    }

    @readonly
    entity VehicleUsages         as projection on db.VehicleUsages {
        code,
        name
    }

    @readonly
    entity CustomerStates        as projection on db.CustomerStates {
        code,
        name
    }

    @readonly
    entity EndCustomerStates     as projection on db.EndCustomerStates {
        code,
        name
    }

    @readonly
    entity VehicleAvailabilities as projection on db.VehicleAvailabilities {
        code,
        name
    }

    @readonly
    entity SalesTypes            as projection on db.SalesTypes {
        brand,
        id,
        material,
        salesOrganisation,
        name
    };

    @readonly
    entity Colors                as projection on db.Colors {
        id,
        name
    };

    @readonly
    entity Equipments            as projection on db.Equipments {
        id,
        name
    };

    @readonly
    entity Models                as projection on db.Models {
        id,
        name
    }

    @readonly
    entity VehicleEchipments     as projection on db.VehicleEquipments {
        equipment,
        vehicle,
        equipment.id,
        equipment.displayName
    }
}
