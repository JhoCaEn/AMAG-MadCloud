using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/colors'
service AppBackofficeColorsService {
    @readonly
    entity Colors       as projection on db.Colors {
        id,
        code,
        type,
        technicalKey,
        displayName,
        modifiedAt,
        createdAt,
        brand,
        models,
        texts
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity Colors.texts as projection on db.Colors.texts

    extend projection Colors.texts with {
        language : Association to one Languages on language.code = locale
    }

    @readonly
    entity ColorTypes   as projection on db.ColorTypes {
        code,
        name
    }

    @readonly
    entity Brands       as projection on db.Brands {
        code,
        name
    };

    @readonly
    entity ModelColors  as projection on db.ModelColors {
        model.id,
        model.code,
        model.year,
        model.name,
        model @cds.api.ignore,
        color
    }
}
