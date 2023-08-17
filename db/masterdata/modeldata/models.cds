namespace retail.dwb;

using {retail.dwb as db} from '../../../db';
using {replicated} from '../../../db';

entity Models : replicated {
    key id                        : String(8);
        name                      : localized String(200);
        year                      : String(4);
        code                      : String(10);
        technicalKey              : String(30);
        releasedForPartner        : Boolean default false;
        releasedForImporteur      : Boolean default false;
        validFrom                 : Date default '1970-01-01';
        validTo                   : Date default '9999-12-31';
        orderableFrom             : Date default '1970-01-01';
        orderableTo               : Date default '9999-12-31';
        isNetSalesPrices          : Boolean default false;
        isOEMBuildableCheckActive : Boolean default false;
        brand                     : db.Brand           @assert.integrity: false;
        category                  : db.ModelCategory   @assert.integrity: false;
        salesType                 : db.SalesType       @assert.integrity: false;
        engine                    : db.Engine          @assert.integrity: false;
        transmission              : db.Transmission    @assert.integrity: false;
        bodyType                  : db.BodyType        @assert.integrity: false;
        modelSeries               : db.ModelSeriesType @assert.integrity: false;

        salesPrice                : Association to one db.CurrentModelSalesPrices
                                        on salesPrice.model = $self;

        colors                    : Composition of many db.ModelColors
                                        on colors.model = $self;
        colorCombinations         : Composition of many db.ModelColorCombinations
                                        on colorCombinations.model = $self;
        equipments                : Composition of many db.ModelEquipments
                                        on equipments.model = $self;
        salesPrices               : Composition of many db.ModelSalesPrices
                                        on salesPrices.model = $self;
        restrictions              : Composition of many db.ModelRestrictions
                                        on restrictions.model = $self;
}

type Model : Association to Models;
