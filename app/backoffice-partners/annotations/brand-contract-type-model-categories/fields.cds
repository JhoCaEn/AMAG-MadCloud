using AppBackofficePartnersService as service from '../../../../srv';

annotate service.BrandContractTypeModelCategories with {
    type @UI.Hidden;
    code @Common.ValueListWithFixedValues;
    code @Common.ValueList: {
        CollectionPath: 'ModelCategories',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterOut',
                LocalDataProperty: code,
                ValueListProperty: 'code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name'
            }
        ]
    };
};

annotate service.BrandContractTypeModelCategories with @Common.SemanticKey: [code];

annotate service.BrandContractTypeModelCategories with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>ModelCategory}',
    TypeNamePlural: '{i18n>ModelCategories}',
    Title         : {
        $Type: 'UI.DataField',
        Value: code
    },
    Description   : {
        $Type: 'UI.DataField',
        Value: name
    }
}};
