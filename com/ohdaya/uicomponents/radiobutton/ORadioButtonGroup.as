package com.ohdaya.uicomponents.radiobutton 
{
	import com.ohdaya.utils.OSprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ohdaya
	 */
	public class ORadioButtonGroup extends OSprite 
	{
		protected var callback:Function;
		protected var radioarr:Array;
		protected var _index:int = 0;
		protected var radiobutton:ORadioButton;
		public function ORadioButtonGroup(p_x:Number,p_y:Number,p_callback:Function) 
		{
			super(true);
			this.radioarr = [];
			this.x = p_x;
			this.y = p_y;
			this.callback = p_callback;
		}
		
		public function addRadioButton(p_rb:ORadioButton,isdispatch:Boolean = true):void
		{
			if (!p_rb)
			{
				trace("该radiobutton不存在");
				return;
			}
			this.radiobutton = p_rb;
			this.radiobutton.index = this._index;
			this._index++;
			this.radiobutton.callback = onClick;
			this.addChild(this.radiobutton);
			this.radioarr.push(this.radiobutton);
			if ((this.radiobutton.index == 0) && (isdispatch))
			{
				this.radiobutton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			}
		}
		
		public function get index():int
		{
			if (this.radiobutton) return this.radiobutton.index;
			return -1;
		}
		override protected function onClick(e:MouseEvent):void
		{
			this.radiobutton = e.currentTarget as ORadioButton;
			if (this.radiobutton == null) return;
			var i:int;
			for (i = 0; i < this.radioarr.length;i++ )
			{
				if (this.radiobutton.index != this.radioarr[i].index)
				{
					this.radioarr[i].isSelected = false;
				}
			}
			
			if(this.callback != null) this.callback.apply(null,[index])
		}
		
		override public function dispose():void
		{
			this.radioarr = [];
			this.callback = null;
			super.dispose();
		}
		
		
	}

}