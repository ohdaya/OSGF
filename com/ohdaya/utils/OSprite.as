package com.ohdaya.utils 
{
	import com.ohdaya.interfaces.Idispose;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * game baisc displayobejct,close mouse interate
	 * @author ohdaya
	 */
	public class OSprite extends Sprite implements Idispose 
	{
		protected var ismouseevent:Boolean;
		public function OSprite(p_mouseevent:Boolean = false) 
		{
			super();
			this.ismouseevent = p_mouseevent;
			this.mouseChildren = p_mouseevent;
			this.mouseEnabled = p_mouseevent;
			//wont be valid on mobile devices
			this.tabChildren = false;
			this.tabEnabled = false;
			
			if(this.ismouseevent){
				this.addEventListener(MouseEvent.CLICK, onClick);
				this.addEventListener(MouseEvent.MOUSE_OVER, onOver);
				this.addEventListener(MouseEvent.MOUSE_OUT, onOut);
			}
		}
		
		protected function onClick(e:MouseEvent):void
		{
			
		}
		
		protected function onOver(e:MouseEvent):void
		{
			
		}
		
		protected function onOut(e:MouseEvent):void
		{
			
		}
		
		public function dispose():void
		{
			if(this.ismouseevent){
				this.removeEventListener(MouseEvent.CLICK, onClick);
				this.removeEventListener(MouseEvent.MOUSE_OVER, onOver);
				this.removeEventListener(MouseEvent.MOUSE_OUT, onOut);
			}
			var displaytodelete:*;
			while (this.numChildren){
				displaytodelete  = this.getChildAt(0);
				if (displaytodelete is Bitmap)
				{
					//delete bitmapdata
					(displaytodelete as Bitmap).bitmapData.dispose();
				}
				//delete displayobejct
				if (displaytodelete && displaytodelete.parent)
				{
					displaytodelete.parent.removeChild(displaytodelete);
				}
			}
			
		}
		
	}

}