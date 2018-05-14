package extension.gameanalytics.detail.requests;

/**
   Represents the body of a GameAnalytics init request
**/
typedef InitRequestData = {
	var platform:String;
	var os_version:String;
	var sdk_version:String;
}