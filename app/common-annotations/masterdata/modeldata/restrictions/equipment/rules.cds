using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictionOptionRules with {
    id          @title: '{i18n>General.ID}';
    category    @title: '{i18n>General.category}';
    color       @title: '{i18n>Color}';
    equipment   @title: '{i18n>Equipment}';
    isRequired  @title: '{i18n>ModelEquipmentRestrictionOptionRules.isRequired}';
    isForbidden @title: '{i18n>ModelEquipmentRestrictionOptionRules.isForbidden}';
};

annotate db.ModelEquipmentRestrictionOptionRules with @Common.SemanticKey: [id];

annotate db.ModelEquipmentRestrictionOptionRules with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Rule}',
    TypeNamePlural: '{i18n>Rules}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
