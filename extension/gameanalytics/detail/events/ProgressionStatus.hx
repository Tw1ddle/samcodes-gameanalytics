package extension.gameanalytics.detail.events;

/**
   Progression event status represents the state of an attempt at completing a game level
**/
@:enum abstract ProgressionStatus(String) from String to String {
	var START:String = "Start";
	var FAIL:String = "Fail";
	var COMPLETE:String = "Complete";
}