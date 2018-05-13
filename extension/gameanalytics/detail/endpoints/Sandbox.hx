package extension.gameanalytics.detail.endpoints;

/**
   Sandbox keys and endpoint for the GameAnalytics sandbox
   Use the sandbox-api endpoint with the sandbox keys during implementation and testing
   Note - do not use production keys with the sandbox endpoint, it will only authorise the sandbox keys
   See: https://gameanalytics.com/docs/rest-api-doc
**/
class Sandbox {
	public static inline var sandboxEndpoint:String = "sandbox-api.gameanalytics.com";
	public static inline var sandboxGameKey:String = "5c6bcb5402204249437fb5a7a80a4959";
	public static inline var sandboxSecretKey:String = "16813a12f718bc5c620f56944e1abc3ea13ccbac";
}