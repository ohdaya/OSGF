package com.ohdaya.uicomponents.progressbar 
{
	import com.ohdaya.utils.OSprite;
	import com.ohdaya.utils.OUtils;
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author ohdaya
	 */
	public class OProgressBar extends OSprite 
	{
		protected var bg:Bitmap;
		protected var fg:Bitmap;
		protected var maxwidth:Number;
		public function OProgressBar(p_bg:String,p_fg:String,p_bgpos:Point = null,p_fgpos:Point = null) 
		{
			super(false);
			this.bg = OUtils.getBitmap(p_bg);
			this.fg = OUtils.getBitmap(p_fg);
			if (!p_bgpos) p_bgpos = new Point(0, 0);
			if (!p_fgpos) p_fgpos = new Point(0,0);
			this.bg.x = p_bgpos.x;
			this.bg.y = p_bgpos.y;
			this.fg.x = p_fgpos.x;
			this.fg.y = p_fgpos.y;
			this.addChild(this.bg);
			this.addChild(this.fg);
			this.maxwidth = this.fg.width;
			
		}
		
		public function setProressNum(p_cur:Number,p_total:Number):void
		{
			if (p_cur / p_total > 1)
			{
				this.fg.width = this.maxwidth;
			}
			else{
				this.fg.width = this.maxwidth * p_cur / p_total;
			}
					
		}
		
		public function setProgressPercent(p_percent:Number):void
		{
			if (p_percent > 1)
			{
				this.fg.width = this.maxwidth;
			}
			else{
				this.fg.width = this.maxwidth * p_percent;
			}
		}
		
		override public function dispose():void
		{
			super.dispose();
		}
		
	}

}