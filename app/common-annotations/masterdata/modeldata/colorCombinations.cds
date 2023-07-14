using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorCombinations with {
    exterior      @title: '{i18n>ModelColorCombinations.exterior}';
    interior      @title: '{i18n>ModelColorCombinations.interior}';
    roof          @title: '{i18n>ModelColorCombinations.roof}';
    model         @title: '{i18n>Model}';
    validFrom     @title: '{i18n>General.validFrom}';
    validTo       @title: '{i18n>General.validTo}';
    orderableFrom @title: '{i18n>orderableFrom}';
    orderableTo   @title: '{i18n>orderableTo}';
    createdAt     @title: '{i18n>replicated.createdAt}';
    modifiedAt    @title: '{i18n>General.FieldGroup.Synchronised.modifiedAt}';
};

annotate db.ModelColorCombinations with @Common.SemanticKey: [
    model_id,
    interior_id,
    exterior_id,
    roof_id
];


annotate db.ModelColorCombinations with @UI: {
    HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>ModelColorCombination}',
        TypeNamePlural: '{i18n>ModelColorCombinations}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#Header',
        }
    },

    ConnectedFields #Header: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{interior} / {exterior} / {roof}',
        Data    : {
            $Type        : 'Core.Dictionary',
            interior           : {
                $Type: 'UI.DataField',
                Value: interior_id,
            },
            exterior: {
                $Type: 'UI.DataField',
                Value: exterior_id,
            },
            roof       : {
                $Type: 'UI.DataField',
                Value: roof_id,
            },
        },
    },
};
