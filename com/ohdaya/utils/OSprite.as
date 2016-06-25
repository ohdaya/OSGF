package com.ohdaya.utils 
{
	import com.ohdaya.Idispose;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
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
			
		}
		
		public function dispose():void
		{
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