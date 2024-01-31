{
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixpkgs = { url = "nixpkgs/nixos-unstable"; };
    nixvim = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixvim";
    };
    yandex-browser = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:esseswann/yandex-browser.nix/feat/gpu";
    };
  };

  outputs = { home-manager, nixpkgs, nixvim, self, yandex-browser, ... }@inputs:
    let
      homeManagerModules = [ nixvim.homeManagerModules.nixvim ];
      inherit (self) outputs;
    in {
      homeConfigurations = {
        "jsus@host" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager/home.nix ] ++ homeManagerModules;
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        };
      };
      nixosConfigurations = {
        host = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/configuration.nix ];
          specialArgs = { inherit inputs outputs; };
        };
      };
    };
}
