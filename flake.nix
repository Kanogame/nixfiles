{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";

		nixos-cosmic = {
			url = "github:lilyinstarlight/nixos-cosmic";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { nixpkgs, ... } @ inputs: {
	nixosConfigurations = {
		natsu = nixpkgs.lib.nixosSystem {
			specialArgs = inputs;
			modules = [
				{ nix.settings = {
					substituters = [ "https://cosmic.cachix.org/" ];
					trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
				};} 
				inputs.nixos-cosmic.nixosModules.default
				./hosts/natsu
			];
		};
		};
	};
}
