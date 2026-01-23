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

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    authentik-nix = {
      url = "github:nix-community/authentik-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = {
    self,
    nixpkgs,
    agenix,
    nixarr,
    compose2nix,
    authentik-nix,
    disko,
    ...
  } @ inputs: {
    nixosConfigurations = {
      Theseus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Theseus/configuration.nix
          ./modules/system/common
          ./modules/system/desktop
          inputs.agenix.nixosModules.default
        ];
      };
      Hermes = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Hermes/configuration.nix
          ./modules/system/common
          ./modules/system/server
          inputs.agenix.nixosModules.default
          inputs.nixarr.nixosModules.default
	  inputs.authentik-nix.nixosModules.default
        ];
      };
      Apollo = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Apollo/configuration.nix
          ./modules/system/common
          ./modules/system/server
          inputs.agenix.nixosModules.default
          inputs.nixarr.nixosModules.default
        ];
      };
      Iris = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/Iris/configuration.nix
          ./modules/system/common
          ./modules/system/server
          disko.nixosModules.disko
          inputs.agenix.nixosModules.default
        ];
      };
    };
  };
}
