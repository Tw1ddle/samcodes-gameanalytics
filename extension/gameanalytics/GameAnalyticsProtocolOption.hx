package extension.gameanalytics;

@:enum abstract GameAnalyticsProtocolOption(String) from String to String {
	var HTTP = "http";
	var HTTPS = "https";
}