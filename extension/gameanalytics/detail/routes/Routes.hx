package extension.gameanalytics.detail.routes;

import extension.gameanalytics.detail.impl.GameAnalyticsImpl;
import extension.gameanalytics.GameAnalyticsProtocolOption;

class Routes {
	public static inline function makeInitRoute(protocol:GameAnalyticsProtocolOption, endpoint:String, gameKey:String):String {
		return protocol + "://" + endpoint + "/" + GameAnalyticsImpl.API_VERSION + "/" + gameKey + "/init";
	}
	
	public static inline function makeEventsRoute(protocol:GameAnalyticsProtocolOption, endpoint:String, gameKey:String):String {
		return protocol + "://" + endpoint + "/" + GameAnalyticsImpl.API_VERSION + "/" + gameKey + "/events";
	}
}