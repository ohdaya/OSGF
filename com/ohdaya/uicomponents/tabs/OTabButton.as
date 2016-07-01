package com.ohdaya.uicomponents.tabs 
{
	import com.ohdaya.utils.OSprite;
	import com.ohdaya.utils.OUtils;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ohdaya
	 */
	public class OTabButton extends OSprite 
	{
		protected var imgkey:Array;
		protected var callbackfunc:Function;
		protected var bitmap:Bitmap;
		public var index:int = 0;
		public function OTabButton(p_key:Array,p_x:Number,p_y:Number) 
		{
			super(true);
			imgkey = p_key;
			this.x = p_x;
			this.y = p_y;
			this.buttonMode = true;
			this.useHandCursor = true;
			this.init();
			
		}
		
		protected function init():void
		{
			this.bitmap = new Bitmap();
			var bitmapdata:BitmapData = OUtils.getBitmapdata(imgkey[0]);
			this.bitmap.bitmapData = bitmapdata;
			this.addChild(this.bitmap);
			this.addEventListener(MouseEvent.CLICK, 		onClickHandler);
			//this.addEventListener(MouseEvent.MOUSE_OVER, 	onMouseEvent);
			//this.addEventListener(MouseEvent.MOUSE_OUT, 	onMouseEvent);
		}
		public function set clickFun(value:Function):void {
			callbackfunc	=	value;
		}
		private function onClickHandler(e:MouseEvent):void {
			selected = true;
			if (callbackfunc != null) callbackfunc.apply(null, [e]);
		}
		
		protected var _isselected:Boolean = false;
		public function set selected(p_int:Boolean):void
		{
			this._isselected = p_int;
			var bitmapdata:BitmapData;
			this.bitmap.bitmapData.dispose();
			if (this._isselected == false)
			{
				bitmapdata = OUtils.getBitmapdata(imgkey[0]);
			}
			else
			{
				bitmapdata = OUtils.getBitmapdata(imgkey[1]);
			}
			
			this.bitmap.bitmapData = bitmapdata;
		}
		
		public function get selected():Boolean
		{
			return this._isselected;
		}
		
		override public function dispose():void
		{
			this.removeEventListener(MouseEvent.CLICK, 		onClickHandler);
			super.dispose();
			callbackfunc = null;
		}
		
		
	}

}