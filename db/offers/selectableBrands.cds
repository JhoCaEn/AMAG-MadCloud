namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity OfferSelectableBrands {
    key offer : Association to one db.Offers;
    key brand : db.Brand;
}
