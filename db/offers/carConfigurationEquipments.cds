namespace retail.dwb;

using {retail.dwb as db} from '../../db';

entity OfferCarConfigurationEquipments {
    key offer     : db.Offer;
    key equipment : db.Equipment;
}