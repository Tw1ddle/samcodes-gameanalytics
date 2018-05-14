package extension.gameanalytics;

/**
    The type of compression to use on request content when sending data via the GameAnalytics REST API
**/
@:enum abstract GameAnalyticsCompressionOption(String) {
	var NONE = "none";
	var GZIP = "gzip";
}