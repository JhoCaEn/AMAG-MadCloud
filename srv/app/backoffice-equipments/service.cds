using {retail.dwb as db} from '../../../db';
using {sap.common.Languages as Languages} from '@sap/cds/common';

@path: '/app/backend/backoffice/equipments'
service AppBackofficeEquipmentsService {

    @readonly
    entity Equipments       as projection on db.Equipments {
        id,
        code,
        technicalKey,
        name,
        displayName,
        brand,
        chapter  @cds.api.ignore,
        chapter.id  as chapterId,
        category @cds.api.ignore,
        category.id as categoryId,
        createdAt,
        modifiedAt,
        models,
        texts
    } actions {
        action synchronise(in : $self);
    };

    @readonly
    entity Equipments.texts as projection on db.Equipments.texts;

    extend projection Equipments.texts with {
        language : Association to one Languages on language.code = locale
    };

    @readonly
    entity Chapters         as projection on db.EquipmentChapters {
        brand,
        id,
        name
    };

    @readonly
    entity Categories       as projection on db.EquipmentCategories {
        brand,
        id,
        name
    };

    @readonly
    entity Brands           as projection on db.Brands {
        code,
        name
    };

    @readonly
    entity ModelEquipments as projection on db.ModelEquipments {
        model.id,
        model.code,
        model.year,
        model.name,
        model @cds.api.ignore,
        equipment
    }
}
