using {retail.dwb as db} from '../../../db';

annotate db.SemanticObjects with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>name}';
};

annotate db.SemanticObjects with @Common.SemanticKey: [code];
