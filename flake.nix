{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, ... } @ inputs: {
	nixosConfigurations."Thinkpad-T480" = nixpkgs.lib.nixosSystem {
	    specialArgs = inputs;
	    modules = [
		./configuration.nix
	    ];
	};

  };
}
