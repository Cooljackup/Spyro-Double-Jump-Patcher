using System;

namespace DoubleJumpPatcher {
	public static {

		public static void WarningText(String Text) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Write(Text);
			Console.ForegroundColor = ConsoleColor.White;
		}


		public static int versionIndex = -1;
		public const String[37] gameNames = .(
			//Final Releases
			"Spyro the Dragon (NTSC-U)",
			"Spyro the Dragon (PAL)",
			"Spyro the Dragon (NTSC-J)",
			"Spyro: Ripto's Rage (NTSC-U)",
			"Spyro: Gateway to Glimmer (PAL)",
			"Spyro and Sparx: Tondemo Tours (NTSC-J)",
			"Spyro: Year of the Dragon (v1.0 NTSC-U)",
			"Spyro: Year of the Dragon (v1.1 NTSC-U)",
			"Spyro: Year of the Dragon (v1.0 PAL)",
			"Spyro: Year of the Dragon (v1.1 PAL)",
			//Prototypes
			//Spyro the Dragon
			"Spyro the Dragon - Tabloid Demo (NTSC-U)",
			"Spyro the Dragon - June 15th Prototype (NTSC-U)",
			"Spyro the Dragon - Speciale Demo (PAL)",
			"Spyro the Dragon - July 18th Prototype (NTSC-U)",
			"Spyro the Dragon - August 27th Prototype (PAL)",
			"Spyro the Dragon - Crash 3 Demo (NTSC-U)",
			"Spyro the Dragon - Crash 3 Demo (PAL)",
			"Spyro the Dragon - Foil Demo (NTSC-U)",
			"Spyro the Dragon - PurePure Demo (NTSC-J)",
			"Spyro the Dragon - Taikenban Demo (NTSC-J)",
			//Spyro: Ripto's Rage
			"Spyro: Ripto's Rage - Demo 1 (NTSC-U)",
			"Spyro: Gateway to Glimmer - Demo 2 (PAL)",
			"Spyro: Ripto's Rage - August 11th Prototype (NTSC-U)",
			"Spyro: Ripto's Rage - CTR Demo (NTSC-U)",
			"Spyro: Gateway to Glimmer - CTR Demo (PAL)",
			"Spyro: Ripto's Rage - Standalone Demo (NTSC-U)",
			"Spyro and Sparx: Tondemo Tours - CBR Demo (NTSC-J)",
			"Spyro and Sparx: Tondemo Tours - PurePure Demo (NTSC-J)",
			"Spyro and Sparx: Tondemo Tours - Taikenban Demo (NTSC-J)",
			//Spyro: Year of the Dragon
			"Spyro: Year of the Dragon - April 25th Prototype (NTSC-U)",
			"Spyro: Year of the Dragon - Crash Bash & Spyro 3 Demo (NTSC-U)",
			"Spyro: Year of the Dragon - Test Drive Demo (NTSC-U)",
			"Spyro: Year of the Dragon - Demo 3 (PAL)",
			"Spyro: Year of the Dragon - Demo 4 (PAL)",
			"Spyro: Year of the Dragon - Crash Bash Demo (NTSC-U)",
			"Spyro: Year of the Dragon - Crash Bash Demo (PAL)",
			"Spyro: Year of the Dragon - September 4th Prototype (NTSC-U)"
			);

		public const uint32[37] versionCheck = .(
			//Final Releases
			//Spyro the Dragon
			0x78D8DBF,
			0x1109B,
			0xE69C,
			//Spyro: Ripto's Rage
			0x721E0,
			0x78548,
			0xB7449B3,
			//Spyro: Year of the Dragon
			0x783F8,
			0x784D8,
			0xC508888,
			0xC5091B8,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0xCAF5,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0xCB2D
			);

		public const uint32[37] firstOffset = .(
			//Final Releases
			//Spyro the Dragon
			0x790F2F0,
			0x4AFA0,
			0x493B0,
			//Spyro: Ripto's Rage
			0x39A80,
			0x3C10C,
			0x3BEC8,
			//Spyro: Year of the Dragon
			0x53FDC,
			0x54000,
			0x5676C,
			0x5676C,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0x522CC,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x541A4
			);

		public const uint32[37] secondOffset = .(
			//Final Releases
			//Spyro the Dragon
			0x7911DB4,
			0x4DBA8,
			0x4C3CC,
			//Spyro: Ripto's Rage
			0x39A90,
			0x3C11C,
			0x3BF90,
			//Spyro: Year of the Dragon
			0x54084,
			0x540A8,
			0x56824,
			0x56824,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0x52374,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x5424C
			);

		public const uint32[37] firstOffsetNewValue = .(
			//Final Releases
			//Spyro the Dragon
			0x00000000,
			0x00000000,
			0x00000000,
			//Spyro: Ripto's Rage
			0x2402FE00,
			0x2404FE00,
			0x10000005,
			//Spyro: Year of the Dragon
			0x10000005,
			0x10000005,
			0x10000005,
			0x10000005,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0x10000005,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x10000005
			);

		public const uint32[37] firstOffsetOriginalValue = .(
			//Final Releases
			//Spyro the Dragon
			0x1040001B,
			0x1040001B,
			0x1040001B,
			//Spyro: Ripto's Rage
			0x24020800,
			0x2404099A,
			0x14400005,
			//Spyro: Year of the Dragon
			0x14400005,
			0x14400005,
			0x14400005,
			0x14400005,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0x14400005,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x14400005
			);

		public const uint32[37] secondOffsetNewValue = .(
			//Final Releases
			//Spyro the Dragon
			0x24022000,
			0x24022000,
			0x24022000,
			//Spyro: Ripto's Rage
			0xAC22A08C,
			0xAC24DC94,
			0x10000009,
			//Spyro: Year of the Dragon
			0x00000000,
			0x00000000,
			0x00000000,
			0x00000000,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0x00000000,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x00000000
			);

		public const uint32[37] secondOffsetOriginalValue = .(
			//Final Releases
			//Spyro the Dragon
			0x24021F80,
			0x240225CD,
			0x24021F80,
			//Spyro: Ripto's Rage
			0xAC22A0A8,
			0xAC24DCB0,
			0x18400009,
			//Spyro: Year of the Dragon
			0xAC2003BC,
			0xAC20049C,
			0xAC2036B8,
			0xAC2036B8,
			//Prototypes
			//Spyro the Dragon
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			//Spyro: Year of the Dragon
			0xAC209C8C,
			0x,
			0x,
			0x,
			0x,
			0x,
			0x,
			0xAC200518
			);
	}
}