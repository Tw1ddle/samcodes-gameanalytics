package extension.gameanalytics.detail.requests;

import com.akifox.asynchttp.AsyncHttp.AsyncHttpRequest;
import com.akifox.asynchttp.HttpMethod;
import com.akifox.asynchttp.HttpResponse;
import com.akifox.asynchttp.URL;
import extension.gameanalytics.GameAnalyticsCompressionOption;
import haxe.crypto.Base64;
import haxe.crypto.Hmac;
import haxe.io.Bytes;

class RequestFactory {
	public static function makeRequest(url:String, body:String, secretKey:String, compression:GameAnalyticsCompressionOption, successCallback:HttpResponse-> Void, errorCallback:HttpResponse-> Void):AsyncHttpRequest {
		
		body = '{"platform": "ios", "sdk_version": "rest api v2", "os_version": "ios 8.2"}';
		
		var request = new AsyncHttpRequest();
		request.url = new URL(url);
		request.callback = successCallback;
		request.callbackError = errorCallback;
		request.method = HttpMethod.POST;
		
		switch(compression) {
			case GameAnalyticsCompressionOption.GZIP:
				request.headers.add('Content-Encoding', 'gzip');
				// TODO compress data
			case GameAnalyticsCompressionOption.NONE:
		}
		
		request.headers.add('Content-Type', 'application/json');
		request.headers.add('Authorization', makeHash(secretKey, body));
		request.headers.add('Content-Length', Std.string(Bytes.ofString(body).length));
		request.contentType = 'application/json';
		request.content = body;
		request.timeout = 10;
		request.async = true;
		request.http11 = true;
		
		return request;
	}
	
	private static function makeHash(secretKey:String, body:String):String {
		return Base64.encode(new Hmac(HashMethod.SHA256).make(Bytes.ofString(secretKey), Bytes.ofString(body)));
	}
}