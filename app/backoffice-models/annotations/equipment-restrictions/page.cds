using AppBackofficeModelsService as service from '../../../../srv';

annotate service.ModelEquipmentRestrictions with @UI: {
    HeaderInfo: {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>Restriction}',
        TypeNamePlural: '{i18n>Restrictions}',
        Title         : {
            $Type: 'UI.DataField',
            Value: constraint
        }
    },
    Facets    : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ConstraintsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Constraints}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'ConstraintsFacet',
                Target: 'constraints/@UI.PresentationVariant'
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'OptionsSection',
            Label : '{i18n>BackofficeModels.FieldGroup.Options}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'OptionsFacet',
                Target: 'options/@UI.PresentationVariant'
            }]
        }
    ]
};
