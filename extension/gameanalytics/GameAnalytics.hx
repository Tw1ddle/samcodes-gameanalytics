package extension.gameanalytics;

import extension.gameanalytics.detail.impl.GameAnalyticsImpl;
import haxe.ds.StringMap;

/**
   The GameAnalytics class encapsulates a solution for recording and posting analytics events to the GameAnalytics servers.
**/
class GameAnalytics {
	private var impl:GameAnalyticsImpl;
	
	public function new(settings:GameAnalyticsSettings, listener:GameAnalyticsListener) {
		impl = new GameAnalyticsImpl(settings, listener);
	}
	
	public function startSession():Void {
		impl.startSession();
	}
	
	public function endSession():Void {
		impl.endSession();
	}
	
	public function postEvents():Void {
		impl.postEvents();
	}
	
	public function addGlobalAttribute(attributeName:String, value:String):Void {
		
	}
	
	public function addGlobalAttributeForEventType(eventType:String, attributeName:String, value:String):Void {
		
	}
	
	public function removeGlobalAttribute(attributeName:String):Void {
		
	}
	
	public function removeGlobalAttributeForEventType(eventType:String, attributeName:String):Void {
		
	}
	
	public function addGlobalMetric(metricName:String, value:Float):Void {
		
	}
	
	public function addGlobalMetricForEventType(eventType:String, metricName:String, value:Float):Void {
		
	}
	
	public function removeGlobalMetric(metricName:String):Void {
		
	}
	
	public function removeGlobalMetricForEventType(eventType:String, metricName:String):Void {
		
	}
	
	public function recordEvent(eventType:String, ?attributes:StringMap<String>, ?metrics:Map<String, Float>):Void {
		
	}
}