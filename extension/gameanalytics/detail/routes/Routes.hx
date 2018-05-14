package extension.gameanalytics.detail.routes;

import extension.gameanalytics.GameAnalyticsProtocolOption;
import extension.gameanalytics.detail.version.Version;

/**
   Utility functions for creating URLs for the GameAnalytics REST API routes
**/
class Routes {
	public static inline function makeInitUrl(protocol:GameAnalyticsProtocolOption, collector:String, gameKey:String):String {
		return protocol + "://" + collector + "/" + Version.API_VERSION + "/" + gameKey + "/init";
	}
	
	public static inline function makeEventsUrl(protocol:GameAnalyticsProtocolOption, collector:String, gameKey:String):String {
		return protocol + "://" + collector + "/" + Version.API_VERSION + "/" + gameKey + "/events";
	}
}