sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sessions/test/integration/FirstJourney',
		'sessions/test/integration/pages/SessionsList',
		'sessions/test/integration/pages/SessionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, SessionsList, SessionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sessions') + '/index.html'
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