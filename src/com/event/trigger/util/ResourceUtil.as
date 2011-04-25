package com.event.trigger.util {
	
import mx.resources.ResourceManager;

	public class ResourceUtil {
		
			public function ResourceUtil() {}
			
			public static function getResource( key:String ):String {
				return ResourceManager.getInstance().getString("duration", key );
			}
			
			public static function getDuration():String {
				return ResourceManager.getInstance().getString("duration", "duration");
			}
		
		}
}