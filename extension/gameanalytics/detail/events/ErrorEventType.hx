package extension.gameanalytics.detail.events;

/**
    Error event type
**/
@:enum abstract ErrorEventType(String) from String to String {
	var DEBUG = "debug";
	var INFO = "info";
	var WARNING = "warning";
	var ERROR = "error";
	var CRITICAL = "critical";
}