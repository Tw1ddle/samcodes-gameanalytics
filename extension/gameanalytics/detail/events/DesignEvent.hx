package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   Design events represent basic custom events whose details aren't covered by any of the other event types
**/
typedef DesignEvent = {
	> DefaultAnnotations,
	
	var event_id:String,
	
	@:optional var value:Float
}