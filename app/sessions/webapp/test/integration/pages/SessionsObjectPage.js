sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'sessions',
            componentId: 'SessionsObjectPage',
            entitySet: 'Sessions'
        },
        CustomPageDefinitions
    );
});