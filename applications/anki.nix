{
	home-manager.users.kano = {pkgs, ...}: {
		home.packages = with pkgs; [
			anki
			mpv
		];
	};
}
