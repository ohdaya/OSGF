package com.ohdaya.uicomponents.checkbox 
{
	import com.ohdaya.utils.OSprite;
	import com.ohdaya.utils.OUtils;
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ohdaya
	 */
	public class OCheckBox extends OSprite 
	{
		protected var bitmap:Bitmap;
		protected var unselectedkey:String;
		protected var selectedkey:String;
		protected var callback:Function;
		protected var _isSelected:Boolean;
		public function OCheckBox(p_selected:String,p_unselected:String,p_callback:Function) 
		{
			super(true);
			this._isSelected = false;
			this.unselectedkey = p_unselected;
			this.selectedkey = p_selected;
			this.callback = p_callback;
			this.bitmap = OUtils.getBitmap(p_unselected);
			this.addChild(this.bitmap);
		}
		
		override protected function onClick(e:MouseEvent):void
		{
			this._isSelected = !this._isSelected;
			if (this._isSelected)
			{
				this.bitmap.bitmapData = OUtils.getBitmapdata(this.selectedkey);
			}else
			{
				this.bitmap.bitmapData = OUtils.getBitmapdata(this.unselectedkey);
			}
			if (this.callback != null) this.callback.apply(null, [e]);
			super.onClick(e);
		}
		
		public function get isSelected():Boolean
		{
			return this._isSelected;
		}
		override public function dispose():void
		{
			super.dispose();
		}
		
	}

}