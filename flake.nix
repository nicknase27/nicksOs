{
  description = "NF compliant configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    agenix.url = "github:ryantm/agenix";
    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    agenix,
    ...
  } @ inputs: {
    nixosConfigurations.Theseus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/Theseus/configuration.nix
        inputs.stylix.nixosModules.stylix
        agenix.nixosModules.default
      ];
    };
  };
}
