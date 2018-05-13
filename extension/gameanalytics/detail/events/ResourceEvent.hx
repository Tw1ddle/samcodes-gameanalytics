package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   Resource events track the flow of a virtual currency, registering sinks and sources for a specified virtual currency
**/
typedef ResourceEvent = {
	> DefaultAnnotations,
	
	var event_id:String,
	var amount:Float
}