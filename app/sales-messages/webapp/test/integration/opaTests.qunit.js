sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ch/amag/retail/dwb/salesmessages/test/integration/FirstJourney',
		'ch/amag/retail/dwb/salesmessages/test/integration/pages/SessionsList',
		'ch/amag/retail/dwb/salesmessages/test/integration/pages/SessionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, SessionsList, SessionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ch/amag/retail/dwb/salesmessages') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheSessionsList: SessionsList,
					onTheSessionsObjectPage: SessionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);