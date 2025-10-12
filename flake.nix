{
    description = "NF compliant configuration";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { 
        self, 
        nixpkgs, 
        ... } @ inputs: {
            nixosConfigurations.Theseus =  nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = {inherit inputs;};
                modules = [
                    ./hosts/Theseus/configuration.nix
                ];
        };
        };
}
