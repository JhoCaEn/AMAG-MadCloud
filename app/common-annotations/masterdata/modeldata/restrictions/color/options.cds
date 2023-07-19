using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelColorRestrictionOptions with {
    restriction @title: '{i18n>ModelColorRestriction}';
    id          @title: '{i18n>General.ID}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    modifiedAt  @title: '{i18n>replicated.modifiedAt}';
};

annotate db.ModelColorRestrictionOptions with @Common.SemanticKey: [
    restriction_colorCombination_model_id,
    restriction_colorCombination_exterior_id,
    restriction_colorCombination_interior_id,
    restriction_colorCombination_roof_id,
    restriction_type_code,
    restriction_constraint,
    id
];

annotate db.ModelColorRestrictionOptions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelColorRestrictionOption}',
    TypeNamePlural: '{i18n>ModelColorRestrictionOptions}',
    Title         : {
        $Type: 'UI.DataField',
        Value: id
    }
}};
