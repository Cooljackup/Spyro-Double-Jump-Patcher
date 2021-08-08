using System;
using System.IO;
using System.Diagnostics;

namespace DoubleJumpPatcher {
	class Program {

		public static void Main(String[]args) {
			
			FileStream file = scope FileStream();
			OpenFileDialog filePath = scope OpenFileDialog();
			filePath.SetFilter("ISO/BIN/IMG File (*.iso; *.bin; *.img)|*.iso; *.bin; *.img");
			filePath.CheckFileExists = true;
			Console.ForegroundColor = ConsoleColor.White;

			WarningText("Double Jump Patcher/Unpatcher Tool for the PS1 Spyro Games. \n");
			Console.WriteLine("This tool allows you to add and remove the famous Double Jump glitch anytime into any of the PS1 Spyro Games! \nProgram created and built by Zethical. (Build v08.07.2021) \n");
			Console.Write("If you plan on using this tool I highly recommended creating a backup of your Spyro ROM just in case! \n*");
			WarningText("PLEASE NOTE: Not all builds of the PS1 Spyro Games may be supported! \n");
			Console.Write("If you're okay with this, please proceed. ");
			WarningText("You have been warned! \n");
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
							Console.WriteLine(scope String("\n")..AppendF(gameNames[versionIndex])..AppendF(" was detected! \n"));
							Console.ReadLine(scope String());
						}
					}

					if (versionIndex > -1) {
						file.Seek(firstOffset[versionIndex]);
						if (TrySilent!(file.Read<uint32>()) == firstOffsetOriginalValue[versionIndex]) {
							Console.Write("This is a ");
							WarningText("UNPATCHED ");
							Console.Write(scope String("")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM? "));
							switch (versionIndex) {
							case 0,1,2,5,6,7,8,9:
								WarningText("(You will be adding Double Jump!) \n");
							case 3,4:
								WarningText("(You will be removing Double Jump!) \n");
							}
							Console.WriteLine("Press ENTER to continue.");
							Console.ReadLine(scope String());
							file.Seek(firstOffset[versionIndex]);
							TrySilent!(file.Write<uint32>(firstOffsetNewValue[versionIndex]));
							file.Seek(secondOffset[versionIndex]);
							TrySilent!(file.Write<uint32>(secondOffsetNewValue[versionIndex]));
							Console.Write("Your Spyro ROM has been ");
							WarningText("PATCHED! \n");

						} else {
							Console.Write("This is a ");
							WarningText("PATCHED ");
							Console.Write(scope String("")..AppendF(gameNames[versionIndex])..AppendF(" ROM! \nDo you wish to patch this ROM? "));
							switch (versionIndex) {
							case 0,1,2,5,6,7,8,9:
								WarningText("(You will be removing Double Jump!) \n");
							case 3,4:
								WarningText("(You will be restoring Double Jump!) \n");
							}
							Console.Write("Press ENTER to continue. \n");
							System.Console.ReadLine(scope String());
							file.Seek(firstOffset[versionIndex]);
							TrySilent!(file.Write<uint32>(firstOffsetOriginalValue[versionIndex]));
							file.Seek(secondOffset[versionIndex]);
							TrySilent!(file.Write<uint32>(secondOffsetOriginalValue[versionIndex]));
							Console.Write("Your Spyro ROM has been ");
							WarningText("UNPATCHED! \n");
						}

					} else {
						Console.WriteLine("\nThe file you selected is not a valid Spyro ROM! Are you sure you selected the correct file? \n");
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