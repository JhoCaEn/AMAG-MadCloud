namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity ModelEquipments : replicated {
    key model          : db.Model;
    key equipment      : db.Equipment @assert.integrity: false;
        isStandard     : Boolean default false;
        isPackage      : Boolean default false;
        validFrom      : Date default '1970-01-01';
        validTo        : Date default '9999-12-31';
        orderableFrom  : Date default '1970-01-01';
        orderableTo    : Date default '9999-12-31';

        packageContent : Composition of many db.ModelEquipmentPackageContents
                             on packageContent.package = $self;

        restrictions   : Composition of many db.ModelEquipmentRestrictions
                             on restrictions.equipment = $self;
};

type ModelEquipment : Association to ModelEquipments;
