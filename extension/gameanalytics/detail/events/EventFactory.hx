package extension.gameanalytics.detail.events;

import extension.gameanalytics.detail.events.EventCategory;

/**
   Factory class for creating event instances
**/
class EventFactory {
	public var d:DefaultAnnotations;
	
	public function new(defaultAnnotations:DefaultAnnotations) {
		d = defaultAnnotations;
	}
	
	public function makeBusinessEvent(eventId:String, amount:Int, currency:String, transactionNumber:Int, ?cartType:String, ?receiptInfo:{ store:String, receipt:String, signature:String }):BusinessEvent {
		var event:BusinessEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category: EventCategory.BUSINESS,
			event_id : eventId,
			amount : amount,
			currency : currency,
			transaction_num : transactionNumber
		};
		applyDefaults(event);
		
		if (cartType != null) {
			event.cart_type = cartType;
		}
		if (receiptInfo != null) {
			event.receipt_info = receiptInfo;
		}
		
		return event;
	}
	
	public function makeDesignEvent(eventId:String, ?value:Float):DesignEvent {
		var event:DesignEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category : EventCategory.DESIGN,
			event_id : eventId
		};
		applyDefaults(event);
		
		if (value != null) {
			event.value = value;
		}
		
		return event;
	}
	
	public function makeErrorEvent(severity:ErrorEventType, message:String):ErrorEvent {
		var event:ErrorEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category : EventCategory.ERROR,
			severity : severity,
			message : message
		};
		applyDefaults(event);
		
		return event;
	}
	
	public function makeProgressionEvent(eventId:String, ?attemptNumber:Int, ?score:Int):ProgressionEvent {
		var event:ProgressionEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category : EventCategory.PROGRESSION,
			event_id : eventId
		};
		applyDefaults(event);
		
		if (attemptNumber != null) {
			event.attempt_num = attemptNumber;
		}
		if (score != null) {
			event.score = score;
		}
		
		return event;
	}
	
	public function makeResourceEvent(eventId:String, amount:Float):ResourceEvent {
		var event:ResourceEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category : EventCategory.RESOURCE,
			event_id : eventId,
			amount : amount
		};
		applyDefaults(event);
		
		return event;
	}
	
	public function makeSessionStartEvent():SessionStartEvent {
		var event:SessionStartEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category : EventCategory.SESSION_START
		};
		applyDefaults(event);
		
		return event;
	}
	
	public function makeSessionEndEvent(length:Int):SessionEndEvent {
		var event:SessionEndEvent = {
			device: d.device,
			v : d.v,
			user_id : d.user_id,
			client_ts : d.client_ts,
			sdk_version : d.sdk_version,
			os_version : d.os_version,
			manufacturer : d.manufacturer,
			platform : d.platform,
			session_id : d.session_id,
			session_num : d.session_num,
			
			category : EventCategory.SESSION_END,
			length : length
		};
		applyDefaults(event);
		
		return event;
	}
	
	private function applyDefaults(event:DefaultAnnotations):Void {
		// NOTE could do something faster than reflection here
		for(field in Reflect.fields(d)) {
			Reflect.setField(event, field, Reflect.field(d, field));
		}
	}
}