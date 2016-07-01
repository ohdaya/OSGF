package com.ohdaya.managers 
{
	import flash.utils.Dictionary;
	/**
	 * Manage all game resource
	 * @author ohdaya
	 */
	public class ResourceManager 
	{
		
		public function ResourceManager(p_enforce:EnForcer) 
		{
			uiswfsDic = new Dictionary();
		}
		public static var _instance:ResourceManager;
		public static function getInstance():ResourceManager
		{
			if (!_instance)
			{
				_instance = new ResourceManager(new EnForcer())
			}
			return _instance;
		}
		/*************UIassets****************/
		public var uiswfsDic:Dictionary;
		
		
	}

}

class EnForcer
{
	public function Enforcer()
	{
		
	}
}