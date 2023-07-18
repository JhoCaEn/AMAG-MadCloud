using {retail.dwb as db} from '../../../../../../db';

annotate db.ModelColorRestrictions with {
    colorCombination @title: '{i18n>ModelColorCombination}';
    type             @title: '{i18n>ColorType}';
    constraint       @title: '{i18n>Constraint}';
    createdAt        @title: '{i18n>replicated.createdAt}';
    modifiedAt       @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelColorRestrictions with @Common.SemanticKey: [
    colorCombination_model_id,
    colorCombination_exterior_id,
    colorCombination_interior_id,
    colorCombination_roof_id,
    type_code,
    constraint
];

annotate db.ModelColorRestrictions with @UI: {
    HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>ModelColorRestriction}',
        TypeNamePlural: '{i18n>ModelColorRestrictions}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#HeaderTitle',
        }
    },

    ConnectedFields #HeaderTitle: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{type_code} / {constraint}',
        Data    : {
            $Type     : 'Core.Dictionary',
            type_code : {
                $Type: 'UI.DataField',
                Value: type.code,
            },
            constraint: {
                $Type: 'UI.DataField',
                Value: constraint,
            }
        },
    }
};
