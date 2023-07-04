namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity BrandCharacteristics : replicated {
    key brand          : db.Brand;
    key characteristic : db.Characteristic;
        value          : String(30);
}

type BrandCharacteristic : Association to BrandCharacteristics;