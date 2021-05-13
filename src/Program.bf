using System;
using System.IO;

namespace DoubleJumpPatcher {
	class Program {

		public static int versionIndex = -1;
		public const String[9] gameNames = .(
			//Final Releases
			"Spyro the Dragon (NTSC-U)",
			"Spyro the Dragon (PAL)",
			"Spyro the Dragon (NTSC-J)",
			"Spyro: Ripto's Rage (NTSC-U)",
			"Spyro: Gateway to Glimmer (PAL)",
			"Spyro and Sparx: Tondemo Tours (NTSC-J)",
			"Spyro: Year of the Dragon (v1.0 NTSC-U)",
			"Spyro: Year of the Dragon (v1.1 NTSC-U)",
			"Spyro: Year of the Dragon (v1.0/v1.1 PAL)"
			//Prototypes

			);

		public const uint32[9] versionCheck = .(
			//Final Releases
			0x78D8DBF,
			0x1109B,
			0xE69C,
			0x721E0,
			0x78548,
			0xB7449B3,
			0x783F8,
			0x784D8,
			0xCB69
			//Prototypes

			);



		static void Main(String[]args) {

			FileStream file = scope FileStream();
			OpenFileDialog filePath = scope OpenFileDialog();
			filePath.SetFilter("ISO/BIN File (*.iso; *.bin)|*.iso; *.bin");
			filePath.CheckFileExists = true;

			Console.WriteLine("Double Jump Patcher/Unpatcher Tool for the classic Spyro Games. \nThis tool allows you to add and remove the famous Double Jump glitch anytime into any of the classic Spyro Games! \nProgram created and built by Zethical. (Build v05.13.2021) \n\n");
			Console.WriteLine("If you plan on using this tool I highly recommended creating a backup of your Spyro ROM just in case! \n*PLEASE NOTE: Not all builds of the classic Spyro Games may be supported!");
			Console.WriteLine("If you're okay with this, please proceed. You have been warned! \nPress ENTER to continue and then select your Spyro ROM.\n");
			System.Console.ReadLine(scope String());

			if(filePath.ShowDialog() case .Ok(let val)) {
				if(val == .OK) {
					let path = filePath.FileNames[0];
					Console.WriteLine(path);

					
					file.Open(path);
					for (int v < 9) {
						if (file.Length < versionCheck[v]){
							continue;
						}

						file.Seek(versionCheck[v]);
						char8[5] attempt = TrySilent!(file.Read<char8[5]>());
						String attemptString = scope String(&attempt, 5);
						if (attemptString.CompareTo("Spyro", true) == 0) { 
							versionIndex = v;
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" was detected! \n"));
							Console.ReadLine(scope String());
						}
					}

					switch (versionIndex) {
						//Final Releases
						//Spyro the Dragon
						case 0,1,2: {
							Console.WriteLine(versionIndex);
							Console.WriteLine("Spyro the Dragon");
							Console.ReadLine(scope String());
						}

						//Spyro: Ripto's Rage
						case 3,4,5: {
							Console.WriteLine(versionIndex);
							Console.WriteLine("Spyro: Ripto's Rage");
							Console.ReadLine(scope String());
						}

						//Spyro: Year of the Dragon
						case 6,7,8,9: {
							Console.WriteLine(versionIndex);
							Console.WriteLine("Spyro: Year of the Dragon");
							Console.ReadLine(scope String());
						}

						default: {
							Console.WriteLine("Not a valid Spyro ROM! Are you sure you selected the correct file?");
							Console.ReadLine(scope String());
						}
					}
				}
			} else {
				Console.WriteLine("File selection was cancelled! \nPress ENTER to exit the program.");
				Console.ReadLine(scope String());
			}
		}
	}
}