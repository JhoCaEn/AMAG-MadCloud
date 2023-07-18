using AppBackofficeEquipmentsService as service from '../../../../srv';

annotate service.Models with @Common.SemanticKey: [id];

annotate service.Models with {
    model     @UI.Hidden;
    equipment @UI.Hidden;
};

annotate service.Models with @UI: {HeaderInfo: {
    $Type         : 'UI.HeaderInfoType',
    TypeName      : '{i18n>Model}',
    TypeNamePlural: '{i18n>Models}'
}};
