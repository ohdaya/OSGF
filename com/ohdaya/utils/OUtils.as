package com.ohdaya.utils 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.getDefinitionByName;
	/**
	 * generic tools
	 * @author ohdaya
	 */
	public class OUtils 
	{
		public static function getBitmap(p_reskey:String):Bitmap
		{
			var bitmap:Bitmap = new Bitmap();
			var p_class:Class = getDefinitionByName(p_reskey) as Class;
			var bitmapdata:BitmapData = new p_class() as BitmapData;
			bitmap.bitmapData = bitmapdata;
			return bitmap;
			
		}
		
		public static function getBitmapdata(p_reskey:String):BitmapData
		{
			var p_class:Class = getDefinitionByName(p_reskey) as Class;
			var bitmapdata:BitmapData = new p_class() as BitmapData;
			return bitmapdata;
		}
		
	}

}