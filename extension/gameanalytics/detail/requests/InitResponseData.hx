package extension.gameanalytics.detail.requests;

/**
   Represents the body of a successful GameAnalytics init response
**/
typedef InitResponseData = {
	var enabled:Bool;
	var server_ts:Int;
	
	@:optional var flags:Array<String>;
}