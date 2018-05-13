package extension.gameanalytics.detail.requests;

typedef InitResponse = {
	var enabled:Bool;
	var server_ts:Int;
	
	@:optional var flags:Array<String>;
}