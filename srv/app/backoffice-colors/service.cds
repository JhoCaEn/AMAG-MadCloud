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
        name,
        displayName,
        createdAt,
        modifiedAt,
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
    entity Types        as projection on db.ColorTypes {
        code,
        name
    }

    @readonly
    entity Brands       as projection on db.Brands {
        code,
        name
    };

    @readonly
    entity Models       as projection on db.ModelColors {
        model.id,
        model.year,
        model.code,
        model.name,
        model,
        color
    }
}
