using System;
using System.IO;
using System.Threading;

namespace djpatch {
	class Program {

		public const String[3] gameNames = .("Spyro YotD - NTSC v1.0", "Spyro YotD - NTSC v1.1", "Spyro YotD - PAL 1.0/1.1");
		public const uint32[3] versionCheck = .(0x783F8, 0x784D8, 0xCB69);
		public const uint32[3] firstOffset = .(0x53FDC, 0x54000, 0x5676C);
		public const uint32[3] secondOffset = .(0x54084, 0x540A8, 0x56824);
		public const uint32[3] secondOffsetValue = .(0xAC2003BC, 0xAC20049C, 0xAC2036B8);


		static void Main(String[]args) {

			Console.WriteLine("Double Jump Patcher/Unpatcher Tool for Spyro - Year of the Dragon. \nProgram made by Zethical. (Build v9.18.2020) \n\n");
			Console.WriteLine("This tool allows you to enable and disable Double Jump as you please back into Spyro - YotD by editing a few of Spyro's movement instructions to restore Double Jump from Spyro - Ripto's Rage. \n\n*PLEASE NOTE: I recommend making a backup of the ROM you wish to edit just in case if this program decides for whatever reason to mess up and make a mistake! (You have been warned!)");
			Console.WriteLine("\n**HOW TO USE THIS PROGRAM: Drag and drop any Spyro - YotD ROM file you wish to patch/unpatch. \n*NOTE: I cannot guarantee any earlier builds of Spyro - Year of the Dragon will work. (This is where I recommend having a backup! You have been warned, again!)");
			Console.WriteLine("\n\nIf you still wish to proceed, please press ENTER. \n");
			System.Console.ReadLine(scope String());


			FileStream file = scope FileStream();
			if (args.Count == 0) {
				Console.WriteLine("No File Detected! (No path provided.)");

			} else {
				let result  = file.Open(args[0]);

				if (result == .Err(0)) {
					Console.WriteLine("No File Detected! (Are you providing the correct file path?)");
				} else {

					int versionIndex = -1;
					for (int v < 3) {
						file.Seek(versionCheck[v]);
						char8[5] attempt = TrySilent!(file.Read<char8[5]>());
						String attemptS = scope String(&attempt, 5);
						if (attemptS.CompareTo("Spyro", true) == 0) {
							versionIndex = v;
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" was detected!"));
						}

					} if (versionIndex == -1) {
						Console.WriteLine("This is not a Spyro - Year of the Dragon ROM. Try again.");

					} else {

						file.Seek(firstOffset[versionIndex]);
						if (TrySilent!(file.Read<int32>()) == 0x14400005) {
							Console.WriteLine(scope String("This is a unpatched ")..AppendF(gameNames[versionIndex])..AppendF("! \nDo you wish to patch this ROM? (Press ENTER to continue.)"));
							Console.WriteLine("");
							System.Console.ReadLine(scope String());
							file.Seek(firstOffset[versionIndex]);
							int32 readFirstOffset = TrySilent!(file.Read<int32>());
							file.Seek(firstOffset[versionIndex]);
							//Console.WriteLine("{:X}", readFirstOffset);
							TrySilent!(file.Write<int32>(0x10000005));
							file.Seek(firstOffset[versionIndex]);
							int32 readFirstOffsetAgain = TrySilent!(file.Read<int32>());
							//Console.WriteLine("{:X}", readFirstOffsetAgain);
						} else {

							Console.WriteLine(scope String("This is a patched ")..AppendF(gameNames[versionIndex])..AppendF("!"));
							Console.WriteLine("Do you wish to unpatch this ROM? (Press ENTER to continue.)");
							System.Console.ReadLine(scope String());
							file.Seek(firstOffset[versionIndex]);
							int32 readFirstOffset = TrySilent!(file.Read<int32>());
							file.Seek(firstOffset[versionIndex]);
							//Console.WriteLine("{:X}", readFirstOffset);
							TrySilent!(file.Write<int32>(0x14400005));
							file.Seek(firstOffset[versionIndex]);
							int32 readFirstOffsetAgain = TrySilent!(file.Read<int32>());
							//Console.WriteLine("{:X}", readFirstOffsetAgain);
						}

						file.Seek(secondOffset[versionIndex]);
						if (TrySilent!(file.Read<uint32>()) == secondOffsetValue[versionIndex]) {
							file.Seek(secondOffset[versionIndex]);
							int32 readSecondOffset = TrySilent!(file.Read<int32>());
							file.Seek(secondOffset[versionIndex]);
							//Console.WriteLine("{:X}", readSecondOffset);
							TrySilent!(file.Write<int32>(0x00000000));
							file.Seek(secondOffset[versionIndex]);
							int32 readSecondOffsetAgain = TrySilent!(file.Read<int32>());
							//Console.WriteLine("{:X}", readSecondOffsetAgain);
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been patched!"));
							Console.WriteLine("(Double Jump Added!) \n");
							Console.WriteLine("*PLEASE NOTE: This can and **will** enable Anti-Piracy at some point! \nI don't know what exactly triggers it, but you have been warned!");
						} else {

							file.Seek(secondOffset[versionIndex]);
							int32 readSecondOffset = TrySilent!(file.Read<int32>());
							file.Seek(secondOffset[versionIndex]);
							//Console.WriteLine("{:X}", readSecondOffset);
							TrySilent!(file.Write<uint32>(secondOffsetValue[versionIndex]));
							file.Seek(secondOffset[versionIndex]);
							int32 readSecondOffsetAgain = TrySilent!(file.Read<int32>());
							//Console.WriteLine("{:X8}", readSecondOffsetAgain);
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been unpatched!"));
							Console.WriteLine("(Double Jump Removed!)");
						}
					}
				}
			}
			Console.WriteLine("\n_\nPress ENTER to exit.");
			System.Console.ReadLine(scope String());
		}
	}
}