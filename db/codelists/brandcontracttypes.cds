namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity BrandContractTypes : CodeList {
    key brand           : db.Brand;
    key code            : String(7);
        name            : localized String(30);
        modelCategories : Composition of many db.BrandContractTypeModelCategories
                              on modelCategories.brandContractType = $self;
}

type BrandContractType : Association to BrandContractTypes;
