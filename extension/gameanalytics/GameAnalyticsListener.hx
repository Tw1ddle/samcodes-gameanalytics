package extension.gameanalytics;

/**
   Listener class that you can subclass to add custom code to react to SDK events.
   Note that you will still want to call the base class methods after subclassing.
**/
class GameAnalyticsListener {
	public function new() {
		
	}
	
	public function onStartedSession():Void {
		
	}
	
	public function onFailedToStartSession():Void {
		
	}
	
	public function onEndedSession():Void {
		
	}
	
	public function onFailedToEndSession():Void {
		
	}
	
	public function onReportedEvents():Void {
		
	}
	
	public function onFailedToReportEvents():Void {
		
	}
}