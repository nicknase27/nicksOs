{
  description = "My NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    nixarr.url = "github:rasmus-kirk/nixarr";

    compose2nix = {
      url = "github:aksiksi/compose2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    agenix,
    nixarr,
    compose2nix,
    ...
  } @ inputs: {
    nixosConfigurations = {
      Theseus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Theseus/configuration.nix
          ./hosts/common.nix
          inputs.agenix.nixosModules.default
          inputs.nixarr.nixosModules.default
        ];
      };
      Hermes = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Hermes/configuration.nix
          ./hosts/common.nix
          inputs.agenix.nixosModules.default
          inputs.nixarr.nixosModules.default
        ];
      };
    };
  };
}
