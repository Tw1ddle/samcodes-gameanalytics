package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   Error events should be sent whenever something goes wrong with the code
**/
typedef ErrorEvent = {
	> DefaultAnnotations,
	
	var severity:ErrorEventType,
	var message:String
}