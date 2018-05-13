package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   Progression events track attempts at completing game levels
**/
typedef ProgressionEvent = {
	> DefaultAnnotations,
	
	var event_id:String,
	
	@:optional var attempt_num:Int,
	@:optional var score:Int
}