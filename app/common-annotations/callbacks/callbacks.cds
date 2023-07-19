using {retail.dwb as db} from '../../../db';

annotate db.Callbacks with {
    ID          @title: '{i18n>General.ID}';
    semantic    @title: '{i18n>Callbacks.semantic}';
    parameters  @title: '{i18n>Callbacks.parameters}';
    createdAt   @title: '{i18n>Callbacks.createdAt}';
    modifiedAt  @title: '{i18n>Callbacks.modifiedAt}';
};

annotate db.Callbacks with @Common.SemanticKey: [ID];

annotate db.Callbacks with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Callback}',
    TypeNamePlural: '{i18n>Callbacks}',
    Title         : {
        $Type: 'UI.DataField',
        Value: ID
    }
}};
