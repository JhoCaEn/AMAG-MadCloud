namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelEquipmentPackageContents : replicated {
    key package   : db.ModelEquipment;
    key equipment : db.Equipment;
        place     : Integer;
};

type ModelEquipmentPackageContent : Association to ModelEquipmentPackageContents;
