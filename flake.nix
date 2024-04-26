{
  inputs = {
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    nixpkgs = { url = "nixpkgs/nixos-unstable"; };
    yandex-browser = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:miuirussia/yandex-browser.nix";
    };
  };

  outputs = { home-manager, nixpkgs, self, yandex-browser, ... }@inputs:
    let
      homeManagerModules = [ ];
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
