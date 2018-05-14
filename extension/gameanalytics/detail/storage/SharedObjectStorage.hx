package extension.gameanalytics.detail.storage;

import openfl.net.SharedObject;

/**
   Solution for analytics data storage that uses the OpenFL SharedObject API
**/
class SharedObjectStorage implements IDataStorage {
	private var s:SharedObject;
	
	public function new(uniqueSharedObjectName:String) {
		s = SharedObject.getLocal(uniqueSharedObjectName);
	}
	
	public function getString(key:String):String {
		return Reflect.getProperty(s.data, key);
	}
	
	public function setString(key:String, value:String):Void {
		Reflect.setProperty(s.data, key, value);
	}
	
	public function getInt(key:String):Null<Int> {
		return Reflect.getProperty(s.data, key);
	}
	
	public function setInt(key:String, value:Int):Void {
		Reflect.setProperty(s.data, key, value);
	}
	
	public function recordEvent(data:String):Void {
		if (s.data.events == null) {
			s.data.events = [];
		}
		s.data.events.push(data);
	}
	
	public function getEvents():Array<String> {
		if (s.data.events == null) {
			return [];
		}
		return s.data.events;
	}
	
	public function purgeEvents():Void {
		s.data.events = [];
	}
	
	public function commitData():Void {
		s.flush();
	}
}