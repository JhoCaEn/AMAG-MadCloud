using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorRestrictions with {
    type   @title: '{i18n>General.type}';
    modifiedAt  @title: '{i18n>replicated.createdAt}';
    createdAt   @title: '{i18n>replicated.createdAt}';
    constraint @title: '{i18n>ModelColorRestrictions.constraint}';
    colorCombination @title: '{i18n>ModelColorCombination}'
};

annotate db.ModelColorRestrictions with @Common.SemanticKey: [
    colorCombination_exterior_id, 
    colorCombination_interior_id, 
    colorCombination_roof_id, 
    colorCombination_model_id,
    type_code,
    constraint
];
