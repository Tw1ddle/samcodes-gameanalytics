package extension.gameanalytics.detail.events;

/**
   The available categories of event (event types)
**/
@:enum abstract EventCategory(String) from String to String {
	var SESSION_START = "user";
	var SESSION_END = "session_end";
	var BUSINESS = "business";
	var PROGRESSION = "progression";
	var RESOURCE = "resource";
	var DESIGN = "design";
	var ERROR = "error";
}