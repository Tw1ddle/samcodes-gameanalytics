package extension.gameanalytics;

import extension.gameanalytics.detail.impl.GameAnalyticsImpl;
import extension.gameanalytics.detail.events.ErrorEventType;

/**
   The GameAnalytics class encapsulates a solution that records and sends analytics events to the GameAnalytics servers.
**/
class GameAnalytics {
	private var impl:GameAnalyticsImpl;
	
	public function new(settings:GameAnalyticsSettings, listener:GameAnalyticsListener) {
		impl = new GameAnalyticsImpl(settings, listener);
	}
	
	public function init():Void {
		impl.init();
	}
	
	public function recordStartSessionEvent():Void {
		impl.recordStartSessionEvent();
	}
	
	public function recordEndSessionEvent():Void {
		impl.recordEndSessionEvent();
	}
	
	public function recordBusinessEvent(eventId:String, amount:Int, currency:String, transactionNumber:Int, ?cartType:String, ?receiptInfo:{ store:String, receipt:String, signature:String }):Void {
		impl.recordBusinessEvent(eventId, amount, currency, transactionNumber, cartType, receiptInfo);
	}
	
	public function recordDesignEvent(eventId:String, ?value:Float):Void {
		impl.recordDesignEvent(eventId, value);
	}
	
	public function recordErrorEvent(severity:ErrorEventType, message:String):Void {
		impl.recordErrorEvent(severity, message);
	}
	
	public function recordProgressionEvent(eventId:String, ?attemptNumber:Int, ?score:Int):Void {
		impl.recordProgressionEvent(eventId, attemptNumber, score);
	}
	
	public function recordResourceEvent(eventId:String, amount:Float):Void {
		impl.recordResourceEvent(eventId, amount);
	}
	
	public function postEvents():Void {
		impl.postEvents();
	}
}