sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ch.amag.retail.dwb.orderreleases',
            componentId: 'SessionsList',
            entitySet: 'Sessions'
        },
        CustomPageDefinitions
    );
});