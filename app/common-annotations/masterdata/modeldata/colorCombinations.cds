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
};

annotate db.ModelColorCombinations with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelColorCombination}',
    TypeNamePlural: '{i18n>ModelColorCombinations}',
    Title         : {
        $Type: 'UI.DataField',
        Value: exterior_id
    }
}};

annotate db.ModelColorCombinations with @Common.SemanticKey: [
    interior_id,
    exterior_id
];
