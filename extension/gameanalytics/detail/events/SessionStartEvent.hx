package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   The session start event must always be the first event in the first batch of events sent to the server, and must be added each time a session starts
**/
typedef SessionStartEvent = {
	> DefaultAnnotations
}