using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorRestrictionOptions with {
    id          @title: '{i18n>General.ID}';
    modifiedAt  @title: '{i18n>General.FieldGroup.Synchronised.modifiedAt}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    restriction @title: '{i18n>Restriction}';
};

annotate db.ModelColorRestrictionOptions with @Common.SemanticKey: [id];

annotate db.ModelColorRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelColorRestrictionOption}',
    TypeNamePlural: '{i18n>ModelColorRestrictionOptions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
