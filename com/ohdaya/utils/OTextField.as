package com.ohdaya.utils 
{
	//import com.master.utils.RFilter;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * ...
	 * @author odaya
	 */
	public class OTextField
	{

		public static function initTextField(x:int, y:int, txt:String = "", color:uint = ColorManager.TXT_COLOR_WHITE, size:int = 12, isFilters:Boolean = true, isBolder:Boolean = false, isCenter:Boolean = false, centerWidth:int = 100,fontName:String = "SimSun"):TextField {
			if(color == 0xffffff) color	=	OColorManager.TXT_COLOR_WHITE
			
			var tf:TextField	=	new TextField();
				tf.textColor		=	color;
				//tf.embedFonts		=	true;
			var lsTextFormat:TextFormat = new TextFormat();
				lsTextFormat.size 	= 	size;
				lsTextFormat.bold	=	isBolder;
				lsTextFormat.leading	=	3;
				lsTextFormat.font	=	fontName;
			tf.defaultTextFormat	=	lsTextFormat;
			
			tf.mouseEnabled			=	false;
			//tf.cacheAsBitmap		=	true;
			if (isCenter) {
				tf.width = centerWidth;
				tf.autoSize         = 	TextFieldAutoSize.CENTER;
			}else {
				tf.autoSize 		= 	TextFieldAutoSize.LEFT;
			}
			
			if (txt == null)
			{
				txt = "";
			}
			tf.htmlText				=	txt;
			tf.x					=	x;
			tf.y					=	y;
			
			if (isFilters)
				tf.filters	=	[OFilter.TEXT_DROP_SHADOW];
			
			return tf;
		}
	}