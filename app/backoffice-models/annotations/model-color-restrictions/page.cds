using AppBackofficeModelsService as service from '../../../../srv';
using from '../model-color-restriction-constraints/list';
using from '../model-color-restriction-options/list';

annotate service.ModelColorRestrictions with @UI: {

    Facets: [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'ConstraintsSubSection',
            Label : '{i18n>Constraints}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'ConstraintsFacet',
                Target: 'constraints/@UI.PresentationVariant'
            }]
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'OptionsSubSection',
            Label : '{i18n>RestrictionOptions}',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                ID    : 'OptionsFacet',
                Target: 'options/@UI.PresentationVariant'
            }]
        }
    ],
};
