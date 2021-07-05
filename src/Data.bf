using System;

namespace DoubleJumpPatcher {
	public static {

		public static void WarningText(String Text) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.WriteLine(Text);
			Console.ForegroundColor = ConsoleColor.White;
		}

		public static int versionIndex = -1;
		public const String[10] gameNames = .(
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
			"Spyro: Year of the Dragon (v1.1 PAL)"
			//Prototypes

			);

		public const uint32[10] versionCheck = .(
			//Final Releases
			//Spyro the Dragon
			0x78D8DBF,
			0x1109B,
			0xE69C,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0xB7449B3,
			//Spyro: Year of the Dragon
			0x783F8,
			0x784D8,
			0xC508888,
			0xC5091B8
			//Prototypes

			);

		public const uint32[10] firstOffset = .(
			//Final Releases
			//Spyro the Dragon
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x3BEC8,
			//Spyro: Year of the Dragon
			0x53FDC,
			0x54000,
			0x5676C,
			0x5676C
			//Prototypes

			);

		public const uint32[10] secondOffset = .(
			//Final Releases
			//Spyro the Dragon
			0x0,
			0x0,
			0x0,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x3BF90,
			//Spyro: Year of the Dragon
			0x54084,
			0x540A8,
			0x56824,
			0x56824
			//Prototypes

			);

		public const uint32[10] firstOffsetNewValue = .(
			//Final Releases
			//Spyro the Dragon
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x10000005,
			//Spyro: Year of the Dragon
			0x10000005,
			0x10000005,
			0x10000005,
			0x10000005
			//Prototypes

			);

		public const uint32[10] firstOffsetOriginalValue = .(
			//Final Releases
			//Spyro the Dragon
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x14400005,
			//Spyro: Year of the Dragon
			0x14400005,
			0x14400005,
			0x14400005,
			0x14400005
			//Prototypes

			);

		public const uint32[10] secondOffsetNewValue = .(
			//Final Releases
			//Spyro the Dragon
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x10000009,
			//Spyro: Year of the Dragon
			0x00000000,
			0x00000000,
			0x00000000,
			0x00000000
			//Prototypes

			);

		public const uint32[10] secondOffsetOriginalValue = .(
			//Final Releases
			//Spyro the Dragon
			0x,
			0x,
			0x,
			//Spyro: Ripto's Rage
			0x,
			0x,
			0x18400009,
			//Spyro: Year of the Dragon
			0xAC2003BC,
			0xAC20049C,
			0xAC2036B8,
			0xAC2036B8
			//Prototypes

			);
	}
}