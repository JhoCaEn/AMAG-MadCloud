namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelSeries : replicated {
    key brand      : db.Brand;
    key id         : String(10);
        name       : localized String(30);

        salesTypes : Association to many db.SalesTypes
                         on salesTypes.modelSeries = $self;
}

type ModelSeriesType : Association to ModelSeries;
