using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelEquipmentRestrictionOptions with {
    id    @title: '{i18n>Option}';
};

annotate db.ModelEquipmentRestrictionOptions with @Common.SemanticKey: [id];

annotate db.ModelEquipmentRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Option}',
    TypeNamePlural: '{i18n>Options}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
