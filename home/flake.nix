{
  description = "Home Manager configuration for nicksOs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: {
    homeConfigurations = {
      "nick@Theseus" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./hosts/Theseus/home.nix
          ./hosts/common.nix
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
