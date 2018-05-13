package extension.gameanalytics.detail.events;

/**
   All GameAnalytics events include these shared fields.
   The annotation fields that are not marked as optional must be set in every event object.
   See: https://gameanalytics.com/docs/rest-api-doc
**/
typedef DefaultAnnotations = {
	var category:EventCategory,
	
	var device:String,
	var v:Int,
	var user_id:String,
	var client_ts:Int,
	var sdk_version:String,
	var os_version:String,
	var manufacturer:String,
	var platform:String,
	var session_id:String,
	var session_num:UInt,

	@:optional var limit_ad_tracking:Bool,
	@:optional var logon_gamecenter:Bool,
	@:optional var logon_googleplay:Bool,
	@:optional var jailbroken:Bool,
	@:optional var android_id:String,
	@:optional var googleplus_id:String,
	@:optional var facebook_id:String,
	@:optional var gender:String,
	@:optional var birth_year:Int,
	@:optional var custom_01:String,
	@:optional var custom_02:String,
	@:optional var custom_03:String,
	@:optional var build:String,
	@:optional var engine_version:String,
	@:optional var ios_idfv:String,
	@:optional var connection_type:String,
	@:optional var progression:String,
	@:optional var ios_idfa:String,
	@:optional var google_aid:String
}