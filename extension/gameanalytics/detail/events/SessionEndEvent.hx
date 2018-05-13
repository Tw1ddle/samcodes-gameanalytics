package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   Session end event is an event sent at the end of a user session
**/
typedef SessionEndEvent = {
	> DefaultAnnotations,
	
	var length:Int
}