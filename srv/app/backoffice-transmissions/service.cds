using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/transmissions'
service AppBackofficeTransmissionsService {

    @readonly
    entity Transmissions       as projection on db.Transmissions {
        id,
        gears,
        name,
        brand,
        driveType @cds.api.ignore,
        driveType.id as driveTypeId,
        driveType.train,
        type      @cds.api.ignore,
        type.id      as typeId,
        type.shift,
        createdAt,
        modifiedAt,
        models,
        texts
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity Transmissions.texts as projection on db.Transmissions.texts;

    extend projection Transmissions.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity Types               as projection on db.TransmissionTypes {
        brand,
        id,
        name,
        shift
    };

    @readonly
    entity Shifts              as projection on db.TransmissionShifts {
        code,
        name
    };

    @readonly
    entity DriveTypes          as projection on db.DriveTypes {
        brand,
        id,
        name,
        train
    };

    @readonly
    entity DriveTrains         as projection on db.DriveTrains {
        code,
        name
    }

    @readonly
    entity Brands              as projection on db.Brands {
        code,
        name
    };

    @readonly
    entity Models              as projection on db.Models {
        id,
        code,
        year,
        name,
        transmission
    };

}
