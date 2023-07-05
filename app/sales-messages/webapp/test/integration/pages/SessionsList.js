sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'ch.amag.retail.dwb.salesmessages',
            componentId: 'SessionsList',
            entitySet: 'Sessions'
        },
        CustomPageDefinitions
    );
});