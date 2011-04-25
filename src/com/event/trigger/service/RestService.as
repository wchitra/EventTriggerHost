package com.event.trigger.service {
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	import mx.utils.LoaderUtil;
	import mx.utils.SecurityUtil;

	public class RestService {
		
		private static var _instance : RestService;
		
		private var service:HTTPService;
		private var urlLoader:URLLoader;
		
		public static function get instance() : RestService {
			if( _instance == null ) {
				_instance = new RestService();
			}
			
			return _instance;
		}
		
		private function initRestService():void {
			service = new HTTPService();
			service.addEventListener(ResultEvent.RESULT, success);
			service.addEventListener(FaultEvent.FAULT, failure);
			
			service.resultFormat = "e4x";
			service.method = "POST";
		}
		
		public function callRestService( url:String ):void {
//			initRestService();
//			service.url = url;
//			service.send();
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.load( new URLRequest( url ));
		}
		
		public function closeUrlLoader():void {
			if( urlLoader != null )
				urlLoader.close();
		}
		
		public function success( event:Event ):void {
			trace( "Success" );
		}
		
		public function failure( event:Event ):void {
			trace( "Failed" );
		}
	}
}