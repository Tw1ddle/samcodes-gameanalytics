package extension.gameanalytics;

import extension.gameanalytics.detail.requests.InitResponseData;

/**
   Listener class that can be subclassed to add custom code to react to SDK events.
   Note that you should call these base class methods after subclassing.
**/
class GameAnalyticsListener {
	public function new() {
		
	}
	
	public function onInitRequested():Void {
		
	}
	
	public function onInitSucceeded(response:InitResponseData):Void {
		
	}
	
	public function onInitFailed(httpResponseCode:Int):Void {
		
	}
	
	public function onPostEventsRequested():Void {
		
	}
	
	public function onPostEventsSucceeded():Void {
		
	}
	
	public function onPostEventsFailed(httpResponseCode:Int):Void {
		
	}
}