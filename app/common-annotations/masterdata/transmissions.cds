using {retail.dwb as db} from '../../../db';

annotate db.Transmissions with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    gears      @title: '{i18n>Transmissions.gears}';
    driveType  @title: '{i18n>DriveType}';
    type       @title: '{i18n>TransmissionType}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
    createdAt  @title: '{i18n>replicated.createdAt}';
};

annotate db.Transmissions with @Common.SemanticKey: [id];

annotate db.Transmissions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Transmission}',
    TypeNamePlural: '{i18n>Transmissions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
