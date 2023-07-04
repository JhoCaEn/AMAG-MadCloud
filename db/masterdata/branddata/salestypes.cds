namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity SalesTypes : replicated {
    key brand             : db.Brand;
    key id                : String(6);
        material          : String(40);
        name              : localized String(30);
        salesOrganisation : String(4);
        modelSeries       : db.ModelSeriesType @assert.integrity: false;

        models            : Association to many db.Models
                                on models.salesType = $self;
};

type SalesType : Association to SalesTypes;
