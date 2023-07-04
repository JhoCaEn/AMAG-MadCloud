namespace retail.dwb;

using {retail.dwb as db} from '../../db';
using {CodeList} from '../../db';

entity BrandContractTypeModelCategories : CodeList {
    key brandContractType : db.BrandContractType;
    key modelCategory     : db.ModelCategory;
}

type BrandContractTypeModelCategory : Association to BrandContractTypeModelCategories;
