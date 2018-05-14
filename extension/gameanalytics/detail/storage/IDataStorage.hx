package extension.gameanalytics.detail.storage;

/**
   Interface that represents the analytics event data storage/retrieval technique
**/
interface IDataStorage {
	/**
	   Gets a string by key
	   @param	key The key to store the string under
	   @return The string, or null if there is no such string set
	**/
	function getString(key:String):String;
	
	/**
	   Sets the string by key
	   @param	key The key to store the string under
	   @param	value The string to store
	**/
	function setString(key:String, value:String):Void;
	
	/**
	   Gets an integer by key
	   @param	key The key the integer is stored under
	   @return The integer, or null if there is no such integer set
	**/
	function getInt(key:String):Null<Int>;
	
	/**
	   Sets an integer by key
	   @param	key The key to store the integer under
	   @param	value The integer to store
	**/
	function setInt(key:String, value:Int):Void;
	
	/**
	   Records an event to data storage, ready to be posted later
	   @param	data The data of the event to record
	**/
	function recordEvent(data:String):Void;
	
	/**
	   Gets the events in data storage
	   @return The events in data storage
	**/
	function getEvents():Array<String>;
	
	/**
	   Tries to purge all of the events data, useful if we exceed some limit or there is
	   an issue validating an event to be sent to the server
	**/
	function purgeEvents():Void;
	
	/**
	   Tries to commit the events data to disk, useful if the app is going to be deactivated/closed
	**/
	function commitData():Void;
}