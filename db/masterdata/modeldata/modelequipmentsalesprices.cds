namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelEquipmentSalesPrices : replicated {
    key equipment           : db.ModelEquipment @assert.integrity: false;
    key constraintEquipment : db.Equipment      @assert.integrity: false;
    key constraintColor     : db.Color          @assert.integrity: false;
    key validFrom           : Date default '1970-01-01';
        validTo             : Date default '9999-12-31';
        value               : Decimal(11, 2);
        currency            : String(5);
        weighting           : Integer;
};

type ModelEquipmentSalesPrice : Association to ModelEquipmentSalesPrices;
