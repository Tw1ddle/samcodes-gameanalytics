package extension.gameanalytics.detail.requests;

import com.akifox.asynchttp.HttpMethod;
import com.akifox.asynchttp.HttpRequest;
import com.akifox.asynchttp.HttpResponse;
import com.akifox.asynchttp.URL;
import extension.gameanalytics.GameAnalyticsCompressionOption;
import haxe.crypto.Base64;
import haxe.crypto.Hmac;
import haxe.io.Bytes;
import lime.utils.compress.GZip;

/**
   Factory class for creating GameAnalytics REST API requests
**/
class RequestFactory {
	public static function makeRequest(url:String, body:String, secretKey:String, compression:GameAnalyticsCompressionOption, successCallback:HttpResponse-> Void, errorCallback:HttpResponse-> Void):HttpRequest {
		var request = new HttpRequest();
		request.url = new URL(url);
		request.callback = successCallback;
		request.callbackError = errorCallback;
		request.method = HttpMethod.POST;
		
		request.headers.add('Content-Type', 'application/json');
		request.contentType = 'application/json';
		
		switch(compression) {
			case GameAnalyticsCompressionOption.GZIP:
				// NOTE this doesn't work, getting a 401 error which is presumably because the way I'm doing gzip compression is wrong?
				throw "gzip compression isn't working yet...";
				
				request.headers.add('Content-Encoding', 'gzip');
				var compressedBody:Bytes = GZip.compress(Bytes.ofString(body));
				request.headers.add('Authorization', makeHash(secretKey, compressedBody));
				request.content = compressedBody;
			case GameAnalyticsCompressionOption.NONE:
				request.headers.add('Authorization', makeHash(secretKey, Bytes.ofString(body)));
				request.content = body;
		}
		
		request.timeout = 10;
		request.async = true;
		request.http11 = true;
		
		return request;
	}
	
	private static function makeHash(secretKey:String, body:Bytes):String {
		return Base64.encode(new Hmac(HashMethod.SHA256).make(Bytes.ofString(secretKey), body));
	}
}