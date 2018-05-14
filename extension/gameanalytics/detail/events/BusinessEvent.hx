package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.DefaultAnnotations;

/**
   Business events represent details about real-money IAP events
**/
typedef BusinessEvent = {
	> DefaultAnnotations,
	
	var category:EventCategory;
	var event_id:String;
	var amount:Int;
	var currency:String;
	var transaction_num:Int;
	
	@:optional var cart_type:String;
	@:optional var receipt_info:{ store:String, receipt:String, signature:String };
}