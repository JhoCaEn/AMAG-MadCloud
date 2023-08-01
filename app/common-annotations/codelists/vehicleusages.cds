using {retail.dwb as db} from '../../../db';

annotate db.VehicleUsages with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.VehicleUsages with @Common.SemanticKey: [code];

annotate db.VehicleUsages with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>VehicleUsage}',
    TypeNamePlural: '{i18n>VehicleUsages}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
