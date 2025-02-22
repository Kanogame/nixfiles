{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations = {
      natsu = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/natsu
        ];
      };
      # died in horrible accident, left as memorabilia
      gregtech = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/gregtech
        ];
      };
      pc = nixpkgs.lib.nixosSystem {
        specialArgs = inputs;
        modules = [
          ./hosts/pc
        ];
      };
    };
  };
}
