using {retail.dwb as db} from '../../../db';

annotate db.VehicleAvailabilities with {
    code @title: '{i18n>General.code}';
    name @title: '{i18n>General.name}';
};

annotate db.VehicleAvailabilities with @Common.SemanticKey: [code];

annotate db.VehicleAvailabilities with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>VehicleAvailability}',
    TypeNamePlural: '{i18n>VehicleAvailabilities}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
