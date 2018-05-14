package extension.gameanalytics;

/**
   The protocol to use when communicating via the GameAnalytics REST API
**/
@:enum abstract GameAnalyticsProtocolOption(String) from String to String {
	var HTTP = "http";
	var HTTPS = "https";
}