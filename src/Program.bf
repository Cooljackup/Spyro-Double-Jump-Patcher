using System;
using System.IO;

namespace DoubleJumpPatcher {
	class Program {

		public const String[3] gameNames = .("Spyro: Year of the Dragon (v1.0 NTSC-U)", "Spyro: Year of the Dragon (v1.1 NTSC-U)", "Spyro: Year of the Dragon (v1.0/v1.1 PAL)");
		public const uint32[3] versionCheck = .(0x783F8, 0x784D8, 0xCB69);
		public const uint32[3] firstOffset = .(0x53FDC, 0x54000, 0x5676C);
		public const uint32[3] secondOffset = .(0x54084, 0x540A8, 0x56824);
		public const uint32[3] secondOffsetRestoreValue = .(0xAC2003BC, 0xAC20049C, 0xAC2036B8);
		public static int versionIndex = -1;

		static void Main(String[]args) {

			FileStream file = scope FileStream();
			OpenFileDialog filePath = scope OpenFileDialog();

			Console.WriteLine("Double Jump Patcher/Unpatcher Tool for the classic Spyro Games. \nThis tool allows you to add and remove Double Jump anytime into any of the classic Spyro Games! \nProgram created by Zethical. (Build v01.03.2021) \n\n");
			Console.WriteLine("If you plan on using this tool I would recommended creating a backup of your Spyro ROM just in case! \n*PLEASE NOTE: Any older builds of the classic Spyro Games may not work!");
			Console.WriteLine("If you're okay with this, please proceed. You have been warned! \nPress ENTER to continue and select your Spyro ROM. \n");
			System.Console.ReadLine(scope String());

			if(filePath.ShowDialog() case .Ok(let val)) {
				if(val == .OK) {
					let path = filePath.FileNames[0];
					Console.WriteLine(path);


					file.Open(path);
					for (int v < 3) {
						file.Seek(versionCheck[v]);
						char8[5] attempt = TrySilent!(file.Read<char8[5]>());
						String attemptS = scope String(&attempt, 5);
						if (attemptS.CompareTo("Spyro", true) == 0) { 
							versionIndex = v;
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" was detected! \n"));
							Console.ReadLine(scope String());
						}
					}


				}
			} else {
				Console.WriteLine("File selection cancelled! \nPress ENTER to exit.");
				Console.ReadLine(scope String());
			}
		}
	}
}