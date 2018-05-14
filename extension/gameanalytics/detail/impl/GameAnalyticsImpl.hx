package extension.gameanalytics.detail.impl;

import com.akifox.asynchttp.HttpResponse;
import extension.gameanalytics.GameAnalyticsListener;
import extension.gameanalytics.GameAnalyticsSettings;
import extension.gameanalytics.detail.events.DefaultAnnotations;
import extension.gameanalytics.detail.events.ErrorEventType;
import extension.gameanalytics.detail.events.EventFactory;
import extension.gameanalytics.detail.requests.InitRequestData;
import extension.gameanalytics.detail.requests.InitResponseData;
import extension.gameanalytics.detail.requests.RequestFactory;
import extension.gameanalytics.detail.routes.Routes;
import extension.gameanalytics.detail.storage.IDataStorage;
import extension.gameanalytics.detail.storage.SharedObjectStorage;
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
	private var defaultAnnotations:DefaultAnnotations;
	private var eventFactory:EventFactory;
	
	private var initUrl(get, never):String;
	private var eventsUrl(get, never):String;
	
	/**
	   Whether an init request has succeeded since this instance was created
	   This must be true in order for the implementation to be allowed to communicate with GameAnalytics
	   i.e. ignoring this flag could result in GameAnalytics banning the associated game
	**/
	private var initSucceeded(get, never):Bool;
	
	/**
	   Initialization request response data
	   This is null until an initialization request succeeds
	**/
	private var initResponseData:Null<InitResponseData>;
	
	public function new(settings:GameAnalyticsSettings, listener:GameAnalyticsListener) {
		this.settings = settings;
		this.listener = listener;
		storage = new SharedObjectStorage(settings.gameKey);
		defaultAnnotations = makeDefaultAnnotations();
		eventFactory = new EventFactory(defaultAnnotations);
	}
	
	public function init():Void {
		var initRequestData:InitRequestData = { platform : defaultAnnotations.platform, os_version: defaultAnnotations.os_version, sdk_version: defaultAnnotations.sdk_version };
		
		var request = RequestFactory.makeRequest(initUrl, Json.stringify(initRequestData), settings.secretKey, settings.compression, onInitSucceeded, onInitFailed);
		request.send();
	}
	
	public function recordStartSessionEvent():Void {
		var e = eventFactory.makeSessionStartEvent();
		recordEvent(e);
	}
	
	public function recordEndSessionEvent():Void {
		var e = eventFactory.makeSessionEndEvent(0); // TODO length
		recordEvent(e);
	}
	
	public function recordBusinessEvent(eventId:String, amount:Int, currency:String, transactionNumber:Int, ?cartType:String, ?receiptInfo:{ store:String, receipt:String, signature:String }):Void {
		var e = eventFactory.makeBusinessEvent(eventId, amount, currency, transactionNumber, cartType, receiptInfo);
		recordEvent(e);
	}
	
	public function recordDesignEvent(eventId:String, ?value:Float):Void {
		var e = eventFactory.makeDesignEvent(eventId, value);
		recordEvent(e);
	}
	
	public function recordErrorEvent(severity:ErrorEventType, message:String):Void {
		var e = eventFactory.makeErrorEvent(severity, message);
		recordEvent(e);
	}
	
	public function recordProgressionEvent(eventId:String, ?attemptNumber:Int, ?score:Int):Void {
		var e = eventFactory.makeProgressionEvent(eventId, attemptNumber, score);
		recordEvent(e);
	}
	
	public function recordResourceEvent(eventId:String, amount:Float):Void {
		var e = eventFactory.makeResourceEvent(eventId, amount);
		recordEvent(e);
	}
	
	public function postEvents():Void {
		listener.onPostEventsRequested();
		
		var postEventsRequestData:String = Json.stringify(storage.getEvents());
		
		var request = RequestFactory.makeRequest(eventsUrl, postEventsRequestData, settings.secretKey, settings.compression, onPostEventsSucceeded, onPostEventsFailed);
		request.send();
	}
	
	private function get_initUrl():String {
		return Routes.makeInitUrl(settings.protocol, settings.host, settings.gameKey);
	}
	
	private function get_eventsUrl():String {
		return Routes.makeEventsUrl(settings.protocol, settings.host, settings.gameKey);
	}
	
	private function onInitSucceeded(response:HttpResponse):Void {
		var body = response.content;
		
		try {
			initResponseData = Json.parse(body);
		} catch (e:Dynamic) {
			response = null;
		}
		
		listener.onInitSucceeded(initResponseData);
	}
	
	private function onInitFailed(response:HttpResponse):Void {
		trace(response.content);
		
		listener.onInitFailed(response.status);
	}
	
	private function onPostEventsSucceeded(response:HttpResponse):Void {
		listener.onPostEventsSucceeded();
	}
	
	private function onPostEventsFailed(response:HttpResponse):Void {
		trace(response.content);
		
		switch(response.status) {
			case 413, 400: // Too many events or bad JSON - probably have a bug, so purge the events
				storage.purgeEvents();
		}
		listener.onPostEventsFailed(response.status);
	}
	
	// TODO
	private function makeDefaultAnnotations():DefaultAnnotations {
		return {
			device: "todo",
			v: Version.API_VERSION_NUMBER,
			user_id: "todo",
			client_ts: 0, // TODO
			sdk_version: Version.SDK_VERSION,
			os_version: "ios 8.2", // TODO
			manufacturer: "todo",
			platform: "ios", // TODO
			session_id: "de305d54-75b4-431b-adb2-eb6b9e546014", // TODO
			session_num: 0 // TODO

			//limit_ad_tracking:false,
			//logon_gamecenter:false,
			//logon_googleplay:false,
			//jailbroken:true,
			//android_id:"todo",
			//googleplus_id:"todo",
			//facebook_id:"todo",
			//gender:"male",
			//birth_year:2000,
			//custom_01:"todo",
			//custom_02:"todo",
			//custom_03:"todo",
			//build:"9.9.9",
			//engine_version:"todo",
			//ios_idfv:"todo",
			//connection_type:"todo",
			//progression:"todo",
			//ios_idfa:"todo",
			//google_aid:"todo"
		};
	}
	
	private function recordEvent<T:DefaultAnnotations>(e:T):Void {
		e.client_ts = 1438948324; // TODO get server-corrected timestamp
		storage.recordEvent(Json.stringify(e));
		
		// TODO purge events if there are too many of them enqueued?
	}
	
	private function get_initSucceeded():Bool {
		return initResponseData != null;
	}
}