using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelColorRestrictions with {
    colorCombination @UI.Hidden;
    type             @Common          : {
        Text           : type.name,
        TextArrangement: #TextOnly,
        ValueListWithFixedValues
    };
};

annotate service.ModelColorRestrictions with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Restriction}',
    TypeNamePlural: '{i18n>Restrictions}',
}};
