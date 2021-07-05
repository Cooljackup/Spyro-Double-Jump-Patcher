using System;
using System.IO;
using System.Diagnostics;

namespace DoubleJumpPatcher {
	class Program {

		static void Main(String[]args) {

			
			
			Console.ForegroundColor = ConsoleColor.White;
			FileStream file = scope FileStream();
			OpenFileDialog filePath = scope OpenFileDialog();
			filePath.SetFilter("ISO/BIN File (*.iso; *.bin)|*.iso; *.bin");
			filePath.CheckFileExists = true;

			Console.WriteLine("Double Jump Patcher/Unpatcher Tool for the classic Spyro Games. \nThis tool allows you to add and remove the famous Double Jump glitch anytime into any of the classic Spyro Games! \nProgram created and built by Zethical. (Build v07.05.2021) \n\n");
			Console.Write("If you plan on using this tool I highly recommended creating a backup of your Spyro ROM just in case! \n*");
			WarningText("PLEASE NOTE: Not all builds of the classic Spyro Games may be supported!");
			Console.Write("If you're okay with this, please proceed. ");
			WarningText("You have been warned!");
			Console.WriteLine("Press ENTER to continue and then select your Spyro ROM!\n");
			System.Console.ReadLine(scope String());
			Console.WriteLine("___");

			if(filePath.ShowDialog() case .Ok(let val)) {
				if(val == .OK) {
					let path = filePath.FileNames[0];
					WarningText(path);

					
					file.Open(path);
					for (int v < 10) {
						if (file.Length < versionCheck[v]){
							continue;
						}

						file.Seek(versionCheck[v]);
						char8[5] attempt = TrySilent!(file.Read<char8[5]>());
						String attemptString = scope String(&attempt, 5);
						if (attemptString.CompareTo("Spyro", true) == 0) { 
							versionIndex = v;
							Debug.WriteLine(scope String()..AppendF("{:X}", gameNames[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", versionCheck[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", firstOffset[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", firstOffsetNewValue[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", firstOffsetOriginalValue[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", secondOffset[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", secondOffsetNewValue[versionIndex]));
							Debug.WriteLine(scope String()..AppendF("{:X}", secondOffsetOriginalValue[versionIndex]));
							Console.WriteLine(scope String(gameNames[versionIndex])..AppendF(" was detected!"));
							Console.ReadLine(scope String());
						}
					}

					switch (versionIndex) {
						//Spyro the Dragon
						case 0,1,2: {
							Console.WriteLine(versionIndex);
							Console.WriteLine("Spyro the Dragon");
							Console.ReadLine(scope String());
						}

						//Spyro: Ripto's Rage
						case 3,4: {
							Console.WriteLine(versionIndex);
							Console.WriteLine("Spyro: Ripto's Rage");
							Console.ReadLine(scope String());
						}

						//Spyro and Sparx: Tondemo Tours
						case 5: {
							file.Seek(firstOffset[versionIndex]);
							if (TrySilent!(file.Read<uint32>()) == firstOffsetOriginalValue[versionIndex]) {
								Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
								Console.WriteLine("Press Enter to continue.");
								Console.ReadLine(scope String());
								file.Seek(firstOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(firstOffsetNewValue[versionIndex]));
								file.Seek(secondOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(secondOffsetNewValue[versionIndex]));
								Console.WriteLine("Your Spyro ROM has been **PATCHED**! (Double Jump Added!)");
							} else {
								Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
								Console.WriteLine("Press ENTER to continue.");
								System.Console.ReadLine(scope String());
								file.Seek(firstOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(firstOffsetOriginalValue[versionIndex]));
								file.Seek(secondOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(secondOffsetOriginalValue[versionIndex]));
								Console.WriteLine("Your Spyro ROM has been **UNPATCHED**! (Double Jump Removed!)");
							}
						}

						//Spyro: Year of the Dragon
						case 6,7,8,9: {
							file.Seek(firstOffset[versionIndex]);
							if (TrySilent!(file.Read<uint32>()) == firstOffsetOriginalValue[versionIndex]) {
								Console.WriteLine(scope String("This is a **UNPATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM?"));
								Console.WriteLine("Press Enter to continue.");
								Console.ReadLine(scope String());
								file.Seek(firstOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(firstOffsetNewValue[versionIndex]));
								file.Seek(secondOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(secondOffsetNewValue[versionIndex]));
								Console.WriteLine("Your Spyro ROM has been **PATCHED**! (Double Jump Added!)");
								Console.WriteLine("*PLEASE NOTE: Anti-Piracy can and will trigger at some point! I dont know what triggers it, but you have been warned!");
							} else {
								Console.WriteLine(scope String("This is a **PATCHED** ")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to unpatch this ROM?"));
								Console.WriteLine("Press ENTER to continue.");
								System.Console.ReadLine(scope String());
								file.Seek(firstOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(firstOffsetOriginalValue[versionIndex]));
								file.Seek(secondOffset[versionIndex]);
								TrySilent!(file.Write<uint32>(secondOffsetOriginalValue[versionIndex]));
								Console.WriteLine("Your Spyro ROM has been **UNPATCHED**! (Double Jump Removed!)");
							}
						}

						default: {
							Console.WriteLine("The file you selected is not a valid Spyro ROM! Are you sure you selected the correct file?");
							Console.ReadLine(scope String());
						}
					}
				}
			} else {
				Console.WriteLine("File selection was cancelled!");
			}
			Console.WriteLine("Press ENTER to exit the program.");
			Console.ReadLine(scope String());
		}
	}
}