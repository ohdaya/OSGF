package com.ohdaya.uicomponents 
{
	import com.ohdaya.utils.OSprite;
	import com.ohdaya.utils.OUtils;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
	
	/**
	 * basic button,use two bitmapdata
	 * @author ohdaya
	 */
	public class OBitmapButton extends OSprite 
	{
		protected var imgkey:Array;
		protected var callbackfunc:Function;
		protected var bitmap:Bitmap;
		public function OBitmapButton(p_key:Array,p_x:Number,p_y:Number,p_callback:Function) 
		{
			super(true);
			imgkey = p_key;
			this.x = p_x;
			this.y = p_y;
			callbackfunc = p_callback;
			this.buttonMode = true;
			this.useHandCursor = true;
			this.init();
		}
		
		protected function init():void
		{
			this.bitmap = new Bitmap();
			var bitmapdata:BitmapData = OUtils.getBitmapdata("common_green_button_normal");
			this.bitmap.bitmapData = bitmapdata;
			this.addChild(this.bitmap);
			this.addEventListener(MouseEvent.CLICK, onClick);
			this.addEventListener(MouseEvent.MOUSE_OVER, onOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, onOut);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onUp);
		}
		
		protected function onClick(e:MouseEvent):void
		{
			trace("button clicked");
			this.callbackfunc.apply();
		}
		
		protected function onOver(e:MouseEvent):void
		{
			this.bitmap.bitmapData.dispose();
			var bitmapdata:BitmapData = OUtils.getBitmapdata("common_green_button_over");
			this.bitmap.bitmapData = bitmapdata;
		}
		protected function onOut(e:MouseEvent):void
		{
			this.bitmap.bitmapData.dispose();
			var bitmapdata:BitmapData = OUtils.getBitmapdata("common_green_button_normal");
			this.bitmap.bitmapData = bitmapdata;
		}
		protected function onDown(e:MouseEvent):void
		{
			this.bitmap.bitmapData.dispose();
			var bitmapdata:BitmapData = OUtils.getBitmapdata("common_green_button_normal");
			this.bitmap.bitmapData = bitmapdata;
		}
		
		protected function onUp(e:MouseEvent):void
		{
			this.bitmap.bitmapData.dispose();
			var bitmapdata:BitmapData = OUtils.getBitmapdata("common_green_button_over");
			this.bitmap.bitmapData = bitmapdata;
		}
		override public function dispose():void
		{
			this.removeEventListener(MouseEvent.CLICK, onClick);
			this.removeEventListener(MouseEvent.MOUSE_OVER, onOver);
			this.removeEventListener(MouseEvent.MOUSE_OUT, onOut);
			this.removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
			this.removeEventListener(MouseEvent.MOUSE_UP, onUp);
			super.dispose();
		}
		
	}

}