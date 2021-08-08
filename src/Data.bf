using System;

namespace DoubleJumpPatcher {
	public static {

		public static void WarningText(String Text) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Write(Text);
			Console.ForegroundColor = ConsoleColor.White;
		}


		public static int versionIndex = -1;
		public const String[10] gameNames = .(
			"Spyro the Dragon (NTSC-U)",
			"Spyro the Dragon (PAL)",
			"Spyro the Dragon (NTSC-J)",
			"Spyro: Ripto's Rage (NTSC-U)",
			"Spyro: Gateway to Glimmer (PAL)",
			"Spyro and Sparx: Tondemo Tours (NTSC-J)",
			"Spyro: Year of the Dragon (v1.0 NTSC-U)",
			"Spyro: Year of the Dragon (v1.1 NTSC-U)",
			"Spyro: Year of the Dragon (v1.0 PAL)",
			"Spyro: Year of the Dragon (v1.1 PAL)"
			);

		public const uint32[10] versionCheck = .(
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
			0xC5091B8
			);

		public const uint32[10] firstOffset = .(
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
			0x5676C
			);

		public const uint32[10] secondOffset = .(
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
			0x56824
			);

		public const uint32[10] firstOffsetNewValue = .(
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
			0x10000005
			);

		public const uint32[10] firstOffsetOriginalValue = .(
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
			0x14400005
			);

		public const uint32[10] secondOffsetNewValue = .(
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
			0x00000000
			);

		public const uint32[10] secondOffsetOriginalValue = .(
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
			0xAC2036B8
			);
	}
}