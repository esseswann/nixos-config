{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    yandex-browser = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:miuirussia/yandex-browser.nix";
    };
  };

  outputs =
    inputs:
    let
      var = {
        user = "jsus";
      };
    in
    {
      nixosConfigurations.blackbox = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
        specialArgs = {
          inherit inputs;
          inherit var;
        };
      };
    };
}
