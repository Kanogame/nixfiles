{ config, lib, pkgs, ... }:

{
  imports =
	[	<home-manager/nixos>
		./applications/hyprland.nix
		./applications/waybar.nix
		./applications/utils.nix
		./hardware-configuration.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
  	
	networking.hostName = "Thinkpad-T480";
  	networking.networkmanager.enable = true;

	#locales
  	time.timeZone = "Asia/Novosibirsk";
  	i18n.defaultLocale = "en_US.UTF-8";
  	i18n.extraLocaleSettings = {
    		LC_ADDRESS = "ru_RU.UTF-8";
    		LC_IDENTIFICATION = "ru_RU.UTF-8";
    		LC_MEASUREMENT = "ru_RU.UTF-8";
    		LC_MONETARY = "ru_RU.UTF-8";
    		LC_NAME = "ru_RU.UTF-8";
    		LC_NUMERIC = "ru_RU.UTF-8";
    		LC_PAPER = "ru_RU.UTF-8";
    		LC_TELEPHONE = "ru_RU.UTF-8";
    		LC_TIME = "ru_RU.UTF-8";
  	};

  	services.xserver = {
    		xkb.layout = "us";
    		xkb.variant = "";
 	};

	fonts.packages = with pkgs; [
		jetbrains-mono
		noto-fonts-cjk
		noto-fonts
		(nerdfonts.override { fonts = [ "FiraMono" ]; })
	];

	users.users.kano = {
		isNormalUser = true;
		extraGroups = ["wheel" "video" ];
	};

	programs.hyprland.enable = true;
	
	#laptop thing
	services.thermald.enable = true;
	services.upower.enable = true;
	services.tlp = {
		enable = true;
		settings = {
        		CPU_SCALING_GOVERNOR_ON_AC = "performance";
        		CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        		CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        		CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        		CPU_MIN_PERF_ON_AC = 0;
        		CPU_MAX_PERF_ON_AC = 100;
        		CPU_MIN_PERF_ON_BAT = 0;
        		CPU_MAX_PERF_ON_BAT = 20;

			START_CHARGE_THRESH_BAT0 = 40;
       			STOP_CHARGE_THRESH_BAT0 = 80; 
		};
	};
	services.syncthing = {
        	enable = true;
        	user = "laptop";
	};
	services.pipewire = {
  		enable = true;
  		alsa.enable = true;
  		alsa.support32Bit = true;
  		pulse.enable = true;
	};
  	nixpkgs.config.allowUnfree = true;
	services.blueman.enable = true;
  	environment.systemPackages = with pkgs; [
		spotify
		fcitx5
		neovim
		xwayland
		alacritty
		librewolf
		rakudo
		fastfetch
		emacs
		anki-bin

		#utils
		mpv
		wget
		git
		openssh
		socat
		killall
		upower
		starship
		syncthing

		#sound
		pipewire
		pavucontrol

		#gpu
		mesa
		amdvlk

		#doom
		fd
		ripgrep
	];	
	home-manager.users.kano = {pkgs, ...}: {
		home.packages = with pkgs; [ 
			tmux 
			fbterm 
			fbv
			zsh 
		];
		programs.bash.enable = true;
  		home.stateVersion = "24.05";
	};

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
  	
	networking.firewall.allowedTCPPorts = [ 8384 22000 ];
   	networking.firewall.allowedUDPPorts = [ 22000 21027 ];

	system.stateVersion = "24.05"; 
}
