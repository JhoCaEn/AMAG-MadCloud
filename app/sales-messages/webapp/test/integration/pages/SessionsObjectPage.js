sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'ch.amag.retail.dwb.salesmessages',
            componentId: 'SessionsObjectPage',
            entitySet: 'Sessions'
        },
        CustomPageDefinitions
    );
});