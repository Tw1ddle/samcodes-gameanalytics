package extension.gameanalytics.detail.impl;

import com.akifox.asynchttp.HttpResponse;
import extension.gameanalytics.GameAnalyticsListener;
import extension.gameanalytics.GameAnalyticsSettings;
import extension.gameanalytics.detail.requests.InitRequestData;
import extension.gameanalytics.detail.requests.RequestFactory;
import extension.gameanalytics.detail.routes.Routes;
import extension.gameanalytics.detail.storage.IDataStorage;
import extension.gameanalytics.detail.version.Version;
import haxe.Json;

/**
   Cross-platform backend implementation for handling recording of analytics events, storage,
   and postage to the GameAnalytics REST API. Uses asynchronous HTTP/S on supported targets.
**/
class GameAnalyticsImpl {
	private var settings:GameAnalyticsSettings;
	private var listener:GameAnalyticsListener;
	
	private var storage:IDataStorage;
	
	private var initUrl(get, never):String;
	private var eventsUrl(get, never):String;
	
	public var instanceEventIdCounter(default, null):Int = 0;
	
	public function new(settings:GameAnalyticsSettings, listener:GameAnalyticsListener) {
		this.settings = settings;
		this.listener = listener;
	}
	
	public function startSession():Void {
		var initRequestData:InitRequestData = { platform : "ios", os_version: "ios 8.2", sdk_version: Version.SDK_VERSION };
		var request = RequestFactory.makeRequest(initUrl, Json.stringify(initRequestData), settings.secretKey, settings.compression, onStartSessionSucceeded, onStartSessionFailed);
		
		trace(request.toString());
		trace(request.content);
		trace(request.contentType);
		trace(request.method);
		trace(request.url);
		trace(request.finalised);
		trace(request.contentIsBinary);
		trace(request.headers);
		
		request.send();
	}
	
	public function endSession():Void {
		
	}
	
	public function postEvents():Void {
		
	}
	
	private function get_initUrl():String {
		return Routes.makeInitUrl(settings.protocol, settings.host, settings.gameKey);
	}
	
	private function get_eventsUrl():String {
		return Routes.makeEventsUrl(settings.protocol, settings.host, settings.gameKey);
	}
	
	private function onStartSessionSucceeded(response:HttpResponse):Void {
		var error = response.error; // TODO handle response
		
		trace(response);
		trace(response.headers.toString());
	}
	
	private function onStartSessionFailed(response:HttpResponse):Void {
		trace(response);
		trace(response.headers.toString());
	}
}