namespace DoubleJumpPatcher {
	class Values {

		// Main Overlays.
		public const uint32[3] bootMenu1Location = .(0, 0x2CFD8, 0);
		public const uint32[3] bootMenu1ReplaceValue = .(0, 0x1000000C, 0);
		public const uint32[3] bootMenu1RestoreValue = .(0, 0x90820000, 0);
		public const uint32[3] bootMenu2Location = .(0, 0x148960, 0);
		public const uint32[3] bootMenu2ReplaceValue = .(0x10000004, 0, 0);
		public const uint32[3] bootMenu2RestoreValue = .(0, 0x90A20000, 0);

		public const uint32[3] transitionLocation = .(0, 0x2F58C, 0);
		public const uint32[3] transitionReplaceValue = .(0, 0x10000006, 0);
		public const uint32[3] transitionRestoreValue = .(0, 0x9062473E, 0);

		// Atlas = ?

		// Options = ?

		// Credits = ?



		// First Homeworld & Worlds.
		// Worlds are encrypted!

		// Sunrise Springs = Nothing.

		public const uint32[3] sunnyVillaLocation = .(0, 0x487CBB4, 0);
		public const uint32[3] sunnyVillaReplaceValue = .(0, 0x900931A0, 0);
		public const uint32[3] sunnyVillaRestoreValue = .(0, 0x106B31A4, 0);

		// Cloud Spires = Nothing.

		public const uint32[3] moltenCraterLocation = .(0, 0x4F5BE2C, 0);
		public const uint32[3] moltenCraterReplaceValue = .(0, 0x9008D798, 0);
		public const uint32[3] moltenCraterRestoreValue = .(0, 0x106AD79C, 0);

		public const uint32[3] seashellShoreLocation = .(0, 0x538B350, 0);
		public const uint32[3] seashellShoreReplaceValue = .(0, 0x9009A9A4, 0);
		public const uint32[3] seashellShoreRestoreValue = .(0, 0x106BA9AC, 0);

		// Mushroom Speedway = Nothing.

		public const uint32[3] sheilasAlpLocation = .(0, 0x57F4FE0, 0);
		public const uint32[3] sheilasAlpReplaceValue = .(0, 0x900878E8, 0);
		public const uint32[3] sheilasAlpRestoreValue = .(0, 0x106A78EC, 0);

		public const uint32[3] buzzsDungeonLocation = .(0, 0x5994CE0, 0);
		public const uint32[3] buzzsDungeonReplaceValue = .(0, 0x9008512C, 0);
		public const uint32[3] buzzsDungeonRestoreValue = .(0, 0x106A5128, 0);

		// Crawdad Farm = ?


		// Second Homeworld & Worlds.


		// Midday Gardens = Nothing.

		// Icy Peak = ?

		// Enchanted Towers = ?

		// Spooky Swamp = ?

		// Bamboo Terrance = ?

		// Country Speedway = ?

		// Sgt. Byrd's Base = ?

		// Spike's Arena = ?

		// Spider Town = ?


		// Third Homeworld & Worlds.


		// Evening Lake = ?

		// Frozen Altars = ?

		// Lost Fleet = ?

		// Fireworks Factory = ?

		// Charmed Ridge = ?

		// Honey Speedway = ?

		// Bentley's Outpost = ?

		// Scorch's Pit = ?

		// Starfish Reef = ?


		// Fourth Homeworld & Worlds.


		// Midnight Mountain = ?

		// Crystal Islands = ?

		// Desert Ruins = ?

		// Haunted Tomb = ?

		// Dino Mines = ?

		// Harbor Speedway = ?

		// Agent 9's Lab = ?

		// Sorceress's Lair = ?

		// Bugbot Factory = ?

		// Super Bonus Round = ?
	}
}