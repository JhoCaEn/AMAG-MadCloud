namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {replicated} from '../../db';

entity Colors : replicated {
    key id                : String(8);
        code              : String(4);
        type              : db.ColorType;
        technicalKey      : String(11);
        name              : localized String(200);
        displayName       : localized String(200);
        brand             : db.Brand @assert.integrity: false;

        models            : Association to many db.ModelColors
                                on models.color = $self;

        colorCombinations : Association to many db.ModelColorCombinations
                                on (
                                       colorCombinations.exterior = $self
                                    or colorCombinations.interior = $self
                                    or colorCombinations.roof     = $self
                                );
};

type Color : Association to Colors;
