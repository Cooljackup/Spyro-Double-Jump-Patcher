using System;
using System.IO;

namespace DoubleJumpPatcher {
	class Program {

		// Setup basic information variables.
		public const String[3] gameNames = .("Spyro: Year of the Dragon (v1.0 NTSC-U)", "Spyro: Year of the Dragon (v1.1 NTSC-U)", "Spyro: Year of the Dragon (v1.0/v1.1 PAL)");
		public const uint32[3] versionCheck = .(0x783F8, 0x784D8, 0xCB69); // This checks in the .bin file where the first string of "Spyro" is referenced.
		public const uint32[3] firstOffset = .(0x53FDC, 0x54000, 0x5676C); // This is where the first offset is when the first instruction is changed in the .bin file.
		public const uint32[3] secondOffset = .(0x54084, 0x540A8, 0x56824); // This is where the second offset is when the second instruction is changed in the .bin file.
		public const uint32[3] secondOffsetRestoreValue = .(0xAC2003BC, 0xAC20049C, 0xAC2036B8); // These are the original values for each version of the game. The bytes are backwards since thats how they are read.


		// Testing Zone:
		public const uint32 just0 = 0x00000000;
		public const uint32[3] transitionValue = .(0, 0x2F4A8, 0);
		public const uint32[3] transitionRestoreValue = .(0, 0xAC23C794, 0);


		static void Main(String[]args) {

			// Basic window setup.
			Console.WriteLine("Double Jump Patcher/Unpatcher Tool for Spyro: Year of the Dragon. \nProgram created by Zethical. (Build v10.19.2020) \n\n");
			Console.WriteLine("This tool allows you to add and remove Double Jump back as you please into any version of Spyro: Year of the Dragon.");
			Console.WriteLine("HOW IT WORKS: It edits a few lines of code in Spyro's movement instructions, which allows us to restore Double Jump from Spyro: Ripto's Rage back so easily.");
			Console.WriteLine("HOW TO USE THIS PROGRAM: Just drag and drop any Spyro: Year of the Dragon ROM you wish to patch / unpatch onto this! \n");
			Console.WriteLine("**IF** you do plan on using this tool, I would always recommended creating a backup of your ROM just in case. (*NOTE: Older Builds of Spyro: Year of the Dragon may not work! Back it up if you do!");
			Console.WriteLine("If you're okay with this, please proceed. You have been warned! \nPress ENTER to continue. \n");
			System.Console.ReadLine(scope String()); // Waits for the user to hit ENTER, to proceed with code.


			FileStream File = scope FileStream();
			// This detects whether or not the program was launched without a file specified to read.
			if (args.Count == 0 && false) { // Also for debugging purposes! If you use a hardcoded path, make sure to have the && false there. Leave commented out for built versions.
				Console.WriteLine("No file was detected! (Are you sure you're providing a file path to a Spyro: Year of the Dragon ROM?)");

			} else {

				let result = File.Open("C:/Users/coolj/Desktop/spyro3.bin"); // Used for debugging purposes! You can put your own path and replace mine if you want to test it within Beef.
				//let result = File.Open(args[0]); // Make sure to comment this out if you use the other 'let result', as this is for built versions of the program.

				switch (result) {
				case .Err:
					Console.WriteLine("No file was detected! (Are you providing the correct file path to the ROM?)"); // If a path is specified, but no file is detected.

				case .Ok:
					int versionIndex = -1; // Sets it to -1 since if none of the version are found, it keeps it at -1 and lets us return a error to the user.
					// Basic for loop, goes through all 3 offsets from versionCheck, seeing if any of them line up and find the string "Spyro".
					for (int v < 3) {
						File.Seek(versionCheck[v]);
						char8[5] attempt = TrySilent!(File.Read<char8[5]>());
						String attemptS = scope String(&attempt, 5);
						if (attemptS.CompareTo("Spyro", true) == 0) { 
							versionIndex = v; // If the string "Spyro" is found in one of the .bin files, it sets it to the corresponding game, through an array.
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" was detected! \n"));

						}
					}


					if (versionIndex == -1) {
						Console.WriteLine("This is not a Spyro: Year of the Dragon ROM. Try again.");

					} else {

						// Sets the first File.Seek to the first offset. If we dont specify this, it will read it from the beginning of the file.
						File.Seek(firstOffset[versionIndex]);
						if (TrySilent!(File.Read<uint32>()) == 0x14400005) { // If the 4 bytes of data are found, it detects it isn't patched and prompts us to patch it.
							Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
							Console.WriteLine("Press Enter to continue.");
							System.Console.ReadLine(scope String());
							File.Seek(firstOffset[versionIndex]); // Similar to before, we have to specify to read from the first offset.
							TrySilent!(File.Write<uint32>(0x10000005)); // Setting the first value to the new instruction.
							File.Seek(secondOffset[versionIndex]); // Similar to before, we have to specify to read from the second offset.
							TrySilent!(File.Write<uint32>(just0)); // Setting the second value to the new instruction.


							// Testing Zone:
							File.Seek(transitionValue[versionIndex]);
							TrySilent!(File.Write<uint32>(just0));


							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **PATCHED!** \n(Double Jump Added!) \n"));
							Console.WriteLine("*PLEASE NOTE: This can and **will** enable Anti-Piracy at some point! \nI don't know what exactly triggers it, but you have been warned!");

						} else { // If the first offset doesn't match with the 4 bytes specified in the if statement, it detects it is patched and prompts us to unpatch it.
							Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
							Console.WriteLine("Press ENTER to continue.");
							System.Console.ReadLine(scope String());
							File.Seek(firstOffset[versionIndex]); // Similar to before, we have to specify to read from the first offset.
							TrySilent!(File.Write<uint32>(0x14400005)); // Setting the first value back to the original instruction.
							File.Seek(secondOffset[versionIndex]); // Similar to before, we have to specify to read from the second offset.
							TrySilent!(File.Write<uint32>(secondOffsetRestoreValue[versionIndex])); // Setting the second value back to the original instruction, depending on the game.


							// Testing Zone:
							File.Seek(transitionValue[versionIndex]);
							TrySilent!(File.Write<uint32>(transitionRestoreValue[versionIndex]));


							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" has been **UNPATCHED!** \n(Double Jump Removed!)"));

						}
					}
				}
			}

			Console.WriteLine("\n_\nPress ENTER to exit the program.");
			System.Console.ReadLine(scope String());

		}
	}
}