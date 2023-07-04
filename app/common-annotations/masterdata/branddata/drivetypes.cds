using {retail.dwb as db} from '../../../../db';

annotate db.DriveTypes with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    brand      @title: '{i18n>Brand}';
    train      @title: '{i18n>DriveTrain}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.DriveTypes with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.DriveTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>DriveType}',
    TypeNamePlural: '{i18n>DriveTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
