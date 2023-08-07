using {retail.dwb as db} from '../../../db';

@path: '/app/backend/backoffice/order-controls'
service AppBackofficeOrderControlsService {
    @readonly
    entity OrderControls         as projection on db.OrderControls actions {
        action synchronise(in : $self);
    };

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
    entity PartnerRoleSources    as projection on db.PartnerRoleSources {
        code,
        name
    }

    @readonly
    entity VehicleAvailabilities as projection on db.VehicleAvailabilities {
        code,
        name
    }

    @readonly
    entity Partners              as projection on db.Partners {
        id,
        name
    }
}
