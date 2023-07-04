using {retail.dwb as db} from '../../../../db';

annotate db.TransmissionTypes with {
    id         @title: '{i18n>General.ID}';
    name       @title: '{i18n>General.name}';
    brand      @title: '{i18n>Brand}';
    shift      @title: '{i18n>TransmissionShift}';
    createdAt  @title: '{i18n>replicated.createdAt}';
    modifiedAt @title: '{i18n>replicated.modifiedAt}';
};

annotate db.TransmissionTypes with @Common.SemanticKey: [
    brand_code,
    id
];

annotate db.TransmissionTypes with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>TransmissionType}',
    TypeNamePlural: '{i18n>TransmissionTypes}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
