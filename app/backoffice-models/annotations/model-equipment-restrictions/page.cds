using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-equipment-restriction-constraints/list';
using from '../model-equipment-restriction-options/list';

annotate service.ModelEquipmentRestrictions with @UI: {
    Facets    : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ConstraintsSection',
            Label : '{i18n>Constraints}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'ConstraintsFacet',
                Target: 'constraints/@UI.PresentationVariant'
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'OptionsSection',
            Label : '{i18n>RestrictionOptions}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'OptionsFacet',
                Target: 'options/@UI.PresentationVariant'
            }]
        }
    ]
};
