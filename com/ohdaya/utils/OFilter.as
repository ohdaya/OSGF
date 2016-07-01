package com.ohdaya.utils {	
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;

	public class OFilter {

		static public const TEXT_DROP_SHADOW:DropShadowFilter	=	new DropShadowFilter(0, 45, 0, 1, 3, 3, 2.5);
		
		static public const LIGHT_YELLOW:GlowFilter			=	new GlowFilter(0xffff00, 1, 4, 4, 10);
		static public const BORDER_BROWN:GlowFilter			=	new GlowFilter(0x491F02, 1, 2, 2, 10);
		static public const BORDER_WHITE:GlowFilter			=	new GlowFilter(0xffffff, 2, 3, 3, 8);
		static public const BORDER_BLACK:GlowFilter			=	new GlowFilter(0x000000, 1, 2, 2, 6);
		static public const BORDER_YELLOW:GlowFilter		=	new GlowFilter(0xffff00, 1, 2, 2, 6);
		static public const BORDER_PURPLE:GlowFilter		=	new GlowFilter(0x3F1E4D, 1, 2, 2, 6);
		static public const BORDER_GREEN:GlowFilter			=	new GlowFilter(0x55AA22, 1, 4, 4, 6);
		static public const BORDER_RED:GlowFilter			=	new GlowFilter(0xff6600, 1, 2, 2, 10);
		static public const BORDER_RED_BLACK:GlowFilter		=	new GlowFilter(0xCC0000, 1, 2, 2, 10);
		static public const BORDER_RED_INSIDE:GlowFilter	=	new GlowFilter(0xff6600, 1, 4, 4, 10, 1, true);
		static public const BORDER_BLUE_INSIDE:GlowFilter	=	new GlowFilter(0x0066ff, 1, 10,10, 1, 1, true);
		
		static public const BORDER_WHITE_BOLD:GlowFilter	=	new GlowFilter(0xffffff, 1, 4, 4, 6);
		static public const BORDER_BLACK_BOLD:GlowFilter	=	new GlowFilter(0x000000, 1, 4, 4, 6);
		static public const BORDER_RED_BOLD:GlowFilter		=	new GlowFilter(0xff0000, 1, 4, 4, 10);
		
		static public const BORDER_REDB:GlowFilter			=	new GlowFilter(0xCC5544, 1, 2, 2, 6);
		
		static public const BORDER_BLACK_50:GlowFilter		=	new GlowFilter(0x000000, 0.5, 2, 2, 6);
		static public const BORDER_WHITE_CENT:GlowFilter	=	new GlowFilter(0xffffff, 1, 6,  6, 25, 1, true);
		
		static public const BORDER_CHOOSE:GlowFilter		=	new GlowFilter(0xbfa84d, 1, 6, 6, 1.5);
		
		static public const COLOR_MATRIX_LIGHT:ColorMatrixFilter	=	new ColorMatrixFilter( [1, 0.8, 0, 0, 0, 0, 1, 0.75, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0] );
		static public const COLOR_MATRIX_SPECIAL:ColorMatrixFilter	=	new ColorMatrixFilter( [1, 0, 0, 0.13, 0.01, 0, 1, 0, 0.18, 0, 0, 0, 1, 0.13, 0.02, 0, 0, 0, 0.98, 0.02]);
		static public const COLOR_MATRIX_ACTIVE:ColorMatrixFilter	=	new ColorMatrixFilter( [0.52,0,	0,	0,	0,		//	red
																								0,	0.85,0,	0,	0,		//	green
																								0,	0,	0,0.52,	0,		//	blue
																								0,	0,	0,	1, 0] );	//	alpha
																						
		static public const COLOR_MATRIX_SELECT:ColorMatrixFilter	=	new ColorMatrixFilter( [1.2,0,	0,	0,	0,		//	red
																								0,	1.2,0,	0,	0,		//	green
																								0,	0,	1.2,0,	0,		//	blue
																								0,	0,	0,	1, 0] );	//	alpha
																								
		static public const COLOR_MATRIX_BLACK:ColorMatrixFilter	=	new ColorMatrixFilter( [0.5,0,	0,	0,	0,		//	red
																								0,	0.5,0,	0,	0,		//	green
																								0,	0,	0.5,0,	0,		//	blue
																								0,	0,	0,	1, 0] );	//	alpha
																								
		static public const COLOR_MATRIX_WHITE:ColorMatrixFilter	=	new ColorMatrixFilter( [2,	0,	0,	0,	0,		//	red
																								0,	2,	0,	0,	0,		//	green
																								0,	0,	2,	0,	0,		//	blue
																								0,	0,	0,	1, 0] );	//	alpha
																								
		static public const COLOR_MATRIX_BW:ColorMatrixFilter		=	new ColorMatrixFilter( [0.3086, 0.6094, 0.0820, 0, 0,		//	黑白
																								0.3086, 0.6094, 0.0820, 0, 0,		//	green
																								0.3086, 0.6094, 0.0820, 0, 0,		//	blue
																								0,	0,	0,	1,  0] );				//	alpha
																								
		static public const COLOR_MATRIX_BW_ALPHA:ColorMatrixFilter		=	new ColorMatrixFilter( [0.3086, 0.6094, 0.0820, 0, 0,		//	黑白
																								0.3086, 0.6094, 0.0820, 0, 0,		//	green
																								0.3086, 0.6094, 0.0820, 0, 0,		//	blue
																								0,	0,	0,	0.3,  0] );				//	alpha
																								
		static public const COLOR_MATRIX_GREEN:ColorMatrixFilter	=	new ColorMatrixFilter( [0.5,0,	0,	0,	0,		//	red
																								0,	1,	0,	0,	0,		//	green
																								0,	0,	0.5,0,	0,		//	blue
																								0,	0,	0,	1, 	0] );	//	alpha
																								
		static public const COLOR_MATRIX_RED:ColorMatrixFilter		=	new ColorMatrixFilter( [1,	0,	0,	0,	0,		//	red
																								0,	0.5,0,	0,	0,		//	green
																								0,	0,	0.5,0,	0,		//	blue
																								0,	0,	0,	1, 	0] );	//	alpha
																								
		static public const COLOR_MATRIX_BLUE:ColorMatrixFilter		=	new ColorMatrixFilter( [0.5,0,	0,	0,	0,		//	red
																								0,	0.5,0,	0,	0,		//	green
																								0,	0,	1,	0,	0,		//	blue
																								0,	0,	0,	1, 	0] );	//	alpha
																								
		static public const	COLOR_MATRIX_FILM:ColorMatrixFilter	=	new ColorMatrixFilter([		-1, 0,  0,  0, 255,		//	胶片效果(反色)
																								0,  -1, 0,  0, 255,
																								0,  0,  -1, 0, 255,
																								0,  0,  0,  1, 1]	);
		
		
	}	
}
