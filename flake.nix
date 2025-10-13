{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    nixarr.url = "github:rasmus-kirk/nixarr";
  };

  outputs = {
    self,
    nixpkgs,
    agenix,
    nixarr,
    ...
  } @ inputs: {
    nixosConfigurations = {
      Theseus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Theseus/configuration.nix
          inputs.agenix.nixosModules.default
          inputs.nixarr.nixosModules.default
        ];
      };
      Hermes = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Hermes/configuration.nix
          inputs.agenix.nixosModules.default
          inputs.nixarr.nixosModules.default
        ];
      };
    };
  };
}
