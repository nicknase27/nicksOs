{
  description = "Home Manager configuration for nicksOs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    dankMaterialShell,
    ...
  }: {
    homeConfigurations = {
      "nick@Theseus" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/Theseus/home.nix
          ./hosts/common.nix
          dankMaterialShell.homeModules.dankMaterialShell.default
        ];
        extraSpecialArgs = {hostname = "Theseus";};
      };

      "nick@Hermes" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/Hermes/home.nix
          ./hosts/common.nix
        ];
        extraSpecialArgs = {hostname = "Hermes";};
      };

      "nick@Apollo" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/Apollo/home.nix
          ./hosts/common.nix
        ];
        extraSpecialArgs = {hostname = "Apollo";};
      };

      "nick@Iris" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [
          ./hosts/Iris/home.nix
          ./hosts/common.nix
        ];
        extraSpecialArgs = {hostname = "Iris";};
      };
    };
  };
}
