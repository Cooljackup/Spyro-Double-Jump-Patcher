using System;
using System.IO;

namespace DoubleJumpPatcher {
	class Program {

		public static int versionIndex = -1;
		public const String[9] gameNames = .("Spyro the Dragon (NTSC-U)", "Spyro the Dragon (PAL)", "Spyro the Dragon (NTSC-J)", "Spyro: Ripto's Rage (NTSC-U)", "Spyro: Gateway to Glimmer (PAL)", "Spyro and Sparx: Tondemo Tours (NTSC-J)", "Spyro: Year of the Dragon (v1.0 NTSC-U)", "Spyro: Year of the Dragon (v1.1 NTSC-U)", "Spyro: Year of the Dragon (v1.0/v1.1 PAL)");
		public const uint32[9] versionCheck = .(0x78D8DBF, 0x1109B, 0xE69C, 0x721E0, 0x78548, 0xB7449B3, 0x783F8, 0x784D8, 0xCB69);

		// Spyro 1.
		public const uint32[3] s1FirstOffset = .(0x790F2F0, 0x4AFA0, 0x493B0);

		// Spyro 2.
		public const uint32[3] s2FirstOffset = .(0x39A7C, 0x3C108, 0);
		public const uint32[3] s2FirstOffsetRestoreValues = .(0x10400016, 0x1040001A, 0);
		public const uint32[3] s2FirstOffsetReplaceValues = .(0x10000016, 0x1000001A, 0);
		//public const uint32[3] s2SecondOffset = .(0, 0, 0);
		//public const uint32[3] s2SecondOffsetRestoreValue = .(0, 0, 0);

		// Spyro 3.
		public const uint32[3] s3FirstOffset = .(0x53FDC, 0x54000, 0x5676C);
		public const uint32[3] s3SecondOffset = .(0x54084, 0x540A8, 0x56824);
		public const uint32[3] s3SecondOffsetRestoreValue = .(0xAC2003BC, 0xAC20049C, 0xAC2036B8);

		static void Main(String[]args) {
			// Basic window setup.
			Console.WriteLine("Double Jump Patcher/Unpatcher Tool for the classic Spyro Games. \nProgram created by Zethical. (Build v12.06.2020) \n\n");
			Console.WriteLine("This tool allows you to add and remove Double Jump back as you please into any of the classic Spyro Games.");
			Console.WriteLine("HOW IT WORKS: It edits a few lines of code in Spyro's movement instructions, which allows us to restore / remove Double Jump it from any of the classic Spyro Games.");
			Console.WriteLine("HOW TO USE THIS PROGRAM: Just drag and drop any Spyro ROM you wish to patch/unpatch onto this! \n");
			Console.WriteLine("**IF** you do plan on using this tool, I would always recommended creating a backup of your Spyro ROM just in case. \n(*NOTE: Older Builds of any of the Spyro Games may not work! Back it up if you do!)");
			Console.WriteLine("If you're okay with this, please proceed. You have been warned! \nPress ENTER to continue. \n");
			System.Console.ReadLine(scope String());

			FileStream File = scope FileStream();
			if (args.Count == 0 && false) {
				Console.WriteLine("No file was detected! (Are you sure you're providing a file path to a Spyro ROM?)");

			} else {
				let result = File.Open("C:/Users/coolj/Desktop/Spyro Modding/ROMS/Spyro and Sparx - Tondemo Tours (Japan).bin");
				//let result = File.Open(args[0]);

				switch (result) {
					case .Err: {
						Console.WriteLine("No file was detected! (Are you providing the correct file path to the ROM?)");
					}

					case .Ok: {
						for (int v < 9) {
							File.Seek(versionCheck[v]);
							char8[5] attempt = TrySilent!(File.Read<char8[5]>());
							String attemptS = scope String(&attempt, 5);
							if (attemptS.CompareTo("Spyro", true) == 0) { 
								versionIndex = v;
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" was detected! \n"));
								break;
							}
						}
					}
					
					switch(versionIndex) {
						case 0, 1, 2: {
							File.Seek(s1FirstOffset[versionIndex]);
							if (TrySilent!(File.Read<uint32>()) == 0x1040001B) {
								Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
								Console.WriteLine("Press Enter to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(s1FirstOffset[versionIndex]);
								TrySilent!(File.Write<uint32>(0x00000000));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **PATCHED!** \n(Double Jump Added!) \n"));

							} else {
								Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
								Console.WriteLine("Press ENTER to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(s1FirstOffset[versionIndex]);
								TrySilent!(File.Write<uint32>(0x1040001B));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **UNPATCHED!** \n(Double Jump Removed!)"));
							}
						}

						case 3, 4: {
							File.Seek(s2FirstOffset[versionIndex - 3]);
							if (TrySilent!(File.Read<uint32>()) == s2FirstOffsetRestoreValues[versionIndex - 3]) {
								Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
								Console.WriteLine("Press Enter to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(s2FirstOffset[versionIndex - 3]);
								TrySilent!(File.Write<uint32>(s2FirstOffsetReplaceValues[versionIndex - 3]));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **PATCHED!** \n(Double Jump Removed!) \n"));

							} else {
								Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
								Console.WriteLine("Press ENTER to continue.");
								File.Seek(s2FirstOffset[versionIndex - 3]);
								TrySilent!(File.Write<uint32>(s2FirstOffsetRestoreValues[versionIndex - 3]));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **UNPATCHED!** \n(Double Jump Added!)"));
							}
						}

						case 5: {
							File.Seek(0x3BF20);
							if (TrySilent!(File.Read<uint32>()) == 0x10400021) {
								Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
								Console.WriteLine("Press Enter to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(0x3BF20);
								TrySilent!(File.Write<uint32>(0x10000021));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **PATCHED!** \n(Double Jump Added!) \n"));

							} else {
								Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
								Console.WriteLine("Press ENTER to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(0x3BF20);
								TrySilent!(File.Write<uint32>(0x10400021));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **UNPATCHED!** \n(Double Jump Removed!)"));
							}

						}

						case 6, 7, 8: {
							File.Seek(s3FirstOffset[versionIndex - 6]);
							if (TrySilent!(File.Read<uint32>()) == 0x14400005) {
								Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
								Console.WriteLine("Press Enter to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(s3FirstOffset[versionIndex - 6]);
								TrySilent!(File.Write<uint32>(0x10000005));
								File.Seek(s3SecondOffset[versionIndex - 6]);
								TrySilent!(File.Write<uint32>(0x00000000));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **PATCHED!** \n(Double Jump Added!) \n"));
								Console.WriteLine("*PLEASE NOTE: This can and **will** enable Anti-Piracy at some point! \nI don't know what exactly triggers it, but you have been warned!");

							} else {
								Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
								Console.WriteLine("Press ENTER to continue.");
								System.Console.ReadLine(scope String());
								File.Seek(s3FirstOffset[versionIndex - 6]);
								TrySilent!(File.Write<uint32>(0x14400005));
								File.Seek(s3SecondOffset[versionIndex - 6]);
								TrySilent!(File.Write<uint32>(s3SecondOffsetRestoreValue[versionIndex - 5]));
								Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **UNPATCHED!** \n(Double Jump Removed!)"));
							}
						}

						default: {
							Console.WriteLine("This is not a valid Spyro ROM. Try again.");
						}
					}
				}
			}

			Console.WriteLine("\n_\nPress ENTER to exit the program.");
			System.Console.ReadLine(scope String());
		}
	}
}