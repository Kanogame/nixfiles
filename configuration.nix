{ config, lib, pkgs, home-manager, ... }:

{
  imports =
	[	
		home-manager.nixosModules.default
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
  	i18n.defaultLocale = "ja_JP.UTF-8";
  	i18n.extraLocaleSettings = {
    		LC_ADDRESS = "ja_JP.UTF-8";
    		LC_IDENTIFICATION = "ja_JP.UTF-8";
    		LC_MEASUREMENT = "ja_JP.UTF-8";
    		LC_MONETARY = "ja_JP.UTF-8";
    		LC_NAME = "ja_JP.UTF-8";
    		LC_NUMERIC = "ja_JP.UTF-8";
    		LC_PAPER = "ja_JP.UTF-8";
    		LC_TELEPHONE = "ja_JP.UTF-8";
    		LC_TIME = "ja_JP.UTF-8";
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

	console = {
	  earlySetup = true;
	  font = "noto-fonts-cjk";
	};


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
		zef
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

services.displayManager.ly.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];
  	
	services.openssh = {
		enable = true;
		ports = [ 22 ];
		settings = {
			PasswordAuthentication = false;
			AllowUsers = [ "kano" ];
			PermitRootLogin = "no";
		};
	};

	networking.firewall.allowedTCPPorts = [ 8384 22000 22 ];
   	networking.firewall.allowedUDPPorts = [ 22000 21027 ];

	system.stateVersion = "24.05"; 
}
