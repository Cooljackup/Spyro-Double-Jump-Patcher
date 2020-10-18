using System;

namespace DoubleJumpPatcher {
	class Initialization {

		public const String[3] gameNames = .("Spyro YotD - NTSC v1.0", "Spyro YotD - NTSC v1.1", "Spyro YotD - PAL 1.0/1.1");
		public const uint32[3] versionCheck = .(0x783F8, 0x784D8, 0xCB69);
		public const uint32[3] firstOffset = .(0x53FDC, 0x54000, 0x5676C);
		public const uint32[3] secondOffset = .(0x54084, 0x540A8, 0x56824);
		public const uint32[3] secondOffsetValue = .(0xAC2003BC, 0xAC20049C, 0xAC2036B8);

		public const String programName = "hello";
		public const String programCreator = "By: Zethical";

	}
}