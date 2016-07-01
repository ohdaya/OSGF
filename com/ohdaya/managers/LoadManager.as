package com.ohdaya.managers 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;
	import flash.utils.setTimeout;
	import flash.utils.clearTimeout;
	/**
	 * ...
	 * @author ohdaya
	 */
	public class LoadManager 
	{
		
		public function LoadManager(p_enforce:Enforcer) 
		{
			
		}
		private static var _instance:LoadManager;
		public static function getInstance():LoadManager
		{
			if (!_instance)
			{
				_instance = new LoadManager(new Enforcer());
			}
			return _instance;
		}
		/*************uiswf address array***********/
		public static var ERRORMAXTIMES:int = 3;
		private var uistrarr:Array = [];
		private var loader:Loader = new Loader();
		private var uiisloading:Boolean = false;
		private var uiloadcallbacks:Array = [];
		/*****************load uiswf***************************/
		public function loadSingleUIAsset(p_addr:String,p_callback:Function,p_forcefirst:Boolean = false):Boolean
		{
			if (delayid != -1)
			{
				clearTimeout(delayid);
				delayid = -1;
			}
			if (ResourceManager.getInstance().uiswfsDic[p_addr]) return false;
			if (p_forcefirst)
			{
				if (uistrarr.indexOf(p_addr) == -1)
				{
					uistrarr.unshift(p_addr);
					uiloadcallbacks.unshift(p_callback);
				}
			}
			else
			{
				if (uistrarr.indexOf(p_addr) == -1)
				{
					uistrarr.push(p_addr);
					uiloadcallbacks.push(p_callback);
				}
			}
			
			if (!uiisloading)
			{
				loader.load(new URLRequest(ConfigManager.uiurl + uistrarr[0] + "?" + ConfigManager.version),new LoaderContext(false,ApplicationDomain.currentDomain));
				uiisloading = true;
				loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loaderProgress);
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaderComplete);
				loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, loadererror);
			}
			return true;
		}
		
		private function loaderProgress(e:ProgressEvent):void
		{
			trace("loader load " + e.bytesLoaded + " / " + e.bytesTotal);
		}
		
		private function loaderComplete(e:Event):void
		{
			ResourceManager.getInstance().uiswfsDic[this.uistrarr[0]] = true;
			(this.uiloadcallbacks[0] as  Function).apply();
			this.uistrarr.unshift();
			this.uiloadcallbacks.unshift();
			loader.unloadAndStop();
		}
		
		private var delayid:int = -1;
		private var errortimesDic:Dictionary = new Dictionary();
		private function loadererror(e:IOErrorEvent):void
		{
			trace("error " + e.errorID);
			uiisloading = false;
			if (!errortimesDic[this.uistrarr[0]])
			{
				errortimesDic[this.uistrarr[0]] = 0;
			}
			
			if (errortimesDic[this.uistrarr[0]] < ERRORMAXTIMES)
			{
				errortimesDic[this.uistrarr[0]]++ ;
			}
			else
			{
				this.uistrarr.shift();
				this.uiloadcallbacks.shift();
			}
			
			if (this.uistrarr[0])
			{
				delayid = setTimeout(loadSingleUIAsset, 2000, this.uistrarr[0], this.uiloadcallbacks[0]);
			}
			else
			{
				trace("load error");
			}
			
		}
	}

}

class Enforcer
{
	public function Enforcer(){
		
	}
}