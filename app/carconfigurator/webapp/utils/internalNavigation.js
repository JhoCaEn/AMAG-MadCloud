sap.ui.define([], function () {
    "use strict";

    return {
        navTo: async function (configuration, router) {
            const modelId = await configuration.requestProperty('model_id')

            if (!modelId)
                router.navigateToRoute('CarConfigurationModels', {
                    key: configuration.getCanonicalPath().replace(/\/.*\((.*)\)/, '$1')
                })

            if (modelId)
                router.navigateToRoute('CarConfigurationColors', {
                    key: configuration.getCanonicalPath().replace(/\/.*\((.*)\)/, '$1'),
                    query: {
                        layout: 'TwoColumnsBeginExpanded'
                    }
                })

        }
    };
});
