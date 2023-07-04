using {retail.dwb as db} from '../../../db';

annotate db.Engines with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    capacity   @title: '{i18n>Engines.capacity}';
    powerHP    @title: '{i18n>Engines.powerHP}';
    powerKW    @title: '{i18n>Engines.powerKW}';
    cylinders  @title: '{i18n>Engines.cylinders}';
    fuelType   @title: '{i18n>FuelType}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.Engines with @Common.SemanticKey: [id];

annotate db.Engines with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Engine}',
    TypeNamePlural: '{i18n>Engines}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
