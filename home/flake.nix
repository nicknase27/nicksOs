{
  description = "Home Manager configuration for nicksOs";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    stylix,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      "nick@Theseus" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/Theseus/home.nix
          ./hosts/common.nix
          stylix.homeModules.stylix
        ];
        extraSpecialArgs = {hostname = "Theseus";};
      };
      "nick@Hermes" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/Hermes/home.nix
          ./hosts/common.nix
        ];
        extraSpecialArgs = {hostname = "Hermes";};
      };
    };
  };
}
