using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/engines'
service AppBackofficeEnginesService {

    @readonly
    entity Engines       as projection on db.Engines {
        id,
        capacity,
        powerHP,
        powerKW,
        cylinders,
        name,
        brand,
        createdAt,
        modifiedAt,
        fuelType @cds.api.ignore,
        fuelType.id as fuelTypeId,
        fuelType.unit,
        models,
        texts
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity Engines.texts as projection on db.Engines.texts

    extend projection Engines.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity FuelTypes     as projection on db.FuelTypes {
        brand,
        id,
        name,
        unit
    };

    @readonly
    entity Brands        as projection on db.Brands {
        code,
        name
    };

    @readonly
    entity Models        as projection on db.Models {
        id,
        year,
        code,
        name,
        engine
    };
}
