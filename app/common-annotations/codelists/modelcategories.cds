using {retail.dwb as db} from '../../../db';

annotate db.BrandContractTypes with @Common.SemanticKey: [code];

annotate db.ModelCategories with {
    code @Common: {
        Text           : name,
        TextArrangement: #TextOnly
    };
    code @UI.Hidden;
    name @title : '{i18n>General.name}';
};
