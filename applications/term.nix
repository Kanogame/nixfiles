{pkgs, ...}: {
	home-manager.users.kano = {pkgs, ...}: {
		
		programs.alacritty = {
			enable = true;

		};
	};

	programs.zsh.enable = true; 
        users.users.kano.shell = pkgs.zsh;
}
