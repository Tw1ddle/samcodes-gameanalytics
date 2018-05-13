package extension.gameanalytics.detail.impl;

import com.akifox.asynchttp.HttpResponse;
import extension.gameanalytics.GameAnalyticsListener;
import extension.gameanalytics.GameAnalyticsSettings;
import extension.gameanalytics.detail.requests.RequestFactory;
import extension.gameanalytics.detail.routes.Routes;
import extension.gameanalytics.detail.storage.IDataStorage;

/**
   Cross-platform backend implementation for handling recording of analytics events, storage,
   and postage to the GameAnalytics REST API. Uses asynchronous HTTP/S on supported targets.
**/
class GameAnalyticsImpl {
	private var settings:GameAnalyticsSettings;
	private var listener:GameAnalyticsListener;
	
	private var storage:IDataStorage;
	
	private var initRoute(get, never):String;
	private var eventsRoute(get, never):String;
	
	public static inline var SDK_VERSION:String = "rest api v2";
	public static inline var API_VERSION_NUMBER:Int = 2;
	public static inline var API_VERSION:String = "v2";
	
	public var instanceEventIdCounter(default, null):Int = 0;
	
	public function new(settings:GameAnalyticsSettings, listener:GameAnalyticsListener) {
		this.settings = settings;
		this.listener = listener;
	}
	
	public function startSession():Void {
		var request = RequestFactory.makeRequest(initRoute, "todo_testing", settings.secretKey, settings.compression, onStartSessionResponse);
		
		trace(request.toString());
		
		request.send();
	}
	
	public function endSession():Void {
		
	}
	
	public function postEvents():Void {
		
	}
	
	private function get_initRoute():String {
		return Routes.makeInitRoute(settings.protocol, settings.endpoint, settings.gameKey);
	}
	
	private function get_eventsRoute():String {
		return Routes.makeEventsRoute(settings.protocol, settings.endpoint, settings.gameKey);
	}
	
	private function onStartSessionResponse(response:HttpResponse):Void {
		var error = response.error; // TODO handle response
		
		trace(response);
	}
}