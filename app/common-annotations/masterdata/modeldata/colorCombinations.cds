using {retail.dwb as db} from '../../../../db';

annotate db.ModelColorCombinations with {
    model         @title: '{i18n>Model}';
    exterior      @title: '{i18n>ExteriorColor}';
    interior      @title: '{i18n>InteriorColor}';
    roof          @title: '{i18n>RoofColor}';
    validFrom     @title: '{i18n>General.validFrom}';
    validTo       @title: '{i18n>General.validTo}';
    orderableFrom @title: '{i18n>General.orderableFrom}';
    orderableTo   @title: '{i18n>General.orderableTo}';
    createdAt     @title: '{i18n>replicated.createdAt}';
};

annotate db.ModelColorCombinations with @Common.SemanticKey: [
    model_id,
    interior_id,
    exterior_id,
    roof_id
];


annotate db.ModelColorCombinations with @UI: {
    HeaderInfo                  : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>ModelColorCombination}',
        TypeNamePlural: '{i18n>ModelColorCombinations}',
        Title         : {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.ConnectedFields#HeaderTitle',
        }
    },

    ConnectedFields #HeaderTitle: {
        $Type   : 'UI.ConnectedFieldsType',
        Template: '{exterior_id} / {interior_id} / {roof_id}',
        Data    : {
            $Type      : 'Core.Dictionary',
            exterior_id: {
                $Type: 'UI.DataField',
                Value: exterior_id,
            },
            interior_id: {
                $Type: 'UI.DataField',
                Value: interior_id,
            },
            roof_id    : {
                $Type: 'UI.DataField',
                Value: roof_id,
            },
        },
    }
};
