package extension.gameanalytics.detail.requests;

typedef InitResponseData = {
	var enabled:Bool;
	var server_ts:Int;
	
	@:optional var flags:Array<String>;
}