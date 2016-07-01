package com.ohdaya.uicomponents.radiobutton 
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
	public class ORadioButton extends OSprite 
	{
		protected var bitmap:Bitmap;
		protected var selectedkey:String;
		protected var unselectedkey:String;
		protected var _callback:Function;
		public var index:int;
		protected var _isSelected:Boolean;
		public function ORadioButton(p_selected:Array,p_x:Number,p_y:Number) 
		{
			super(true);
			this.x = p_x;
			this.y = p_y;
			this.selectedkey = p_selected[0];
			this.unselectedkey = p_selected[1];
			this._isSelected = false;
			this.index = -1;
			this.bitmap = OUtils.getBitmap(this.unselectedkey);
			this.addChild(this.bitmap);
		}
		
		public function set callback(p_func:Function):void
		{
			this._callback = p_func;
		}
		
		public function set isSelected(p_state:Boolean):void
		{
			this._isSelected = p_state;
			var bitmapdata:BitmapData;
			this.bitmap.bitmapData.dispose();
			if (this._isSelected)
			{
				bitmapdata = OUtils.getBitmapdata(this.selectedkey);
			}
			else
			{
				bitmapdata = OUtils.getBitmapdata(this.unselectedkey);
			}
			this.bitmap.bitmapData = bitmapdata;
		}
		
		public function get isSelected():Boolean
		{
			return this._isSelected;
		}
		override protected function onClick(e:MouseEvent):void
		{
			this.isSelected = true;
			if (this._callback != null) this._callback.apply(null,[e]);
		}
		
		override public function dispose():void
		{
			this._callback = null;
			super.dispose();
		}
		
		
		
	}

}