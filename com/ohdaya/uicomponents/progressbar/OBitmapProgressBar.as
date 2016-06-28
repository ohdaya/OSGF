package com.ohdaya.uicomponents.progressbar 
{
	import com.ohdaya.utils.OFilter;
	import com.ohdaya.utils.OSprite;
	import com.ohdaya.utils.OUtils;
	import flash.display.Bitmap;
	import flash.display.Shape;
	
	/**
	 * ...
	 * @author ohdaya
	 */
	public class OBitmapProgressBar extends OSprite 
	{
		protected var bg:Bitmap;
		protected var fg:Bitmap;
		protected var fgmask:Shape;
		protected var maxwidth:Number;
		public function OBitmapProgressBar(p_key:String) 
		{
			super(false);
			this.bg = OUtils.getBitmap(p_key);
			this.bg.filters = [OFilter.COLOR_MATRIX_BW];
			this.addChild(this.bg);
			this.maxwidth = this.bg.width;
			this.fgmask = new Shape();
			this.fgmask.graphics.beginFill(0, 0.5);
			this.fgmask.graphics.drawRect(0, 0, this.bg.width, this.bg.height);
			this.fgmask.graphics.endFill();
			this.addChild(fgmask);
			this.fg = OUtils.getBitmap(p_key);
			this.addChild(this.fg);
			this.fg.mask = fgmask;
			
			
		}
		
		public function setProressNum(p_cur:Number,p_total:Number):void
		{
			if (p_cur / p_total > 1)
			{
				this.fgmask.width = this.maxwidth;
			}
			else{
				this.fgmask.width = this.maxwidth * p_cur / p_total;
			}
					
		}
		
		public function setProgressPercent(p_percent:Number):void
		{
			if (p_percent > 1)
			{
				this.fgmask.width = this.maxwidth;
			}
			else{
				this.fgmask.width = this.maxwidth * p_percent;
			}
		}
		
		override public function dispose():void
		{
			this.fg.mask = null;
			super.dispose();
		}
		
	}

}