package com.ohdaya.uicomponents.tabs 
{
	import com.ohdaya.utils.OSprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ohdaya
	 */
	public class OTabGroup extends OSprite 
	{
		protected var tabsarr:Array;
		protected var callbackfunc:Function;
		public function OTabGroup(p_x:Number,p_y:Number,p_callback:Function) 
		{
			tabsarr = [];
			this.callbackfunc = p_callback;
			super(true);
		}
		
		protected var _index:int = 0;
		protected var _tabBox:OTabButton;
		public function addTabBox(tabBox:OTabButton,isDispatch:Boolean = true):void {
			if (tabBox == null) {
				trace("添加tabBox 为 null");
				return;
			}
			tabBox.index	=	_index;
			_index	++;
			tabBox.clickFun		=	clickTabBoxHandler;
			addChild(tabBox);
			tabsarr.push(tabBox);
			if (tabBox.index == 0 && isDispatch) tabBox.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
		}
		public function get index():int {
			if (_tabBox) return _tabBox.index;
			return -1;
		}		
		private function clickTabBoxHandler(e:MouseEvent):void {
			_tabBox	=	e.currentTarget	as OTabButton;
			if (_tabBox == null) return;
			for (var i:int = 0; i < tabsarr.length; i++) {
				if (_tabBox.index != tabsarr[i].index) tabsarr[i].selected = false;
			}
			
			if (callbackfunc != null) callbackfunc.apply(null, [index]);
		}
		
	}

}