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
	private static var hmac:Hmac = new Hmac(HashMethod.SHA256);
	
	public static function makeRequest(url:String, data:String, secretKey:String, compression:GameAnalyticsCompressionOption, callback:HttpResponse->Void):AsyncHttpRequest {
		var request = new AsyncHttpRequest();
		request.url = new URL(url);
		request.callback = callback;
		request.method = HttpMethod.POST;
		
		switch(compression) {
			default: // TODO
		}
		
		var authString:String = Base64.encode(hmac.make(Bytes.ofString(secretKey), Bytes.ofString(data)));
		request.headers.add("Authorization", authString);
		request.contentType = "application/json";
		request.content = data;
		request.timeout = 20;
		
		return request;
	}
}