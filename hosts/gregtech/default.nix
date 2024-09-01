{ config, pkgs, ... }:

{
  imports =
    [
    	
	../../modules/general/en-locale.nix
	../../modules/general/pipewire.nix
	../../modules/general/users.nix
    	./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "ACER-5810TZ-4274"; 
  networking.wireless.enable = true;

  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;

  fonts.fonts = with pkgs; [
  (nerdfonts.override { fonts = [ "DroidSansMono" ]; })
  ];

  security.rtkit.enable = true;
	
  time.timeZone = "Asia/Nosibirsk";

  services.xserver = {
    videoDrivers = [ "radeon" ];
    layout = "us";
    xkbVariant = "";
  };


  programs.hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
	distrobox
	libreoffice-qt
	hunspell
	hunspellDicts.en_US
	hunspellDicts.ru_RU
	tofi
	wget
	feh
	slurp
	swappy
	grim
	spotify
	envsubst
	wayvnc
	tk
	(pkgs.python312.withPackages (python-pkgs: [
      		python-pkgs.tkinter
   	 ]))
	killall
	qownnotes
	tmux
	waybar
	swww
	git
	firefox
	file
	unzip
	lshw
	btop
	radeontop
	rofi
	pipewire
	vscodium
	xwayland
	brave
	neovim
	alacritty
	neofetch
  ];

  system.stateVersion = "23.05";

}
