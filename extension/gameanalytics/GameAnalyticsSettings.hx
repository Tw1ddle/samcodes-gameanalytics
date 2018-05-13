package extension.gameanalytics;

/**
   Settings object that must be provided when creating a GameAnalytics instance
**/
typedef GameAnalyticsSettings = {
	var gameKey:String;
	var secretKey:String;
	var host:String;
	var compression:GameAnalyticsCompressionOption;
	var protocol:GameAnalyticsProtocolOption;
}