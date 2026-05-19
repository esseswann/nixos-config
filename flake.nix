{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    yandex-browser = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:miuirussia/yandex-browser.nix";
    };

    tg-ws-proxy.url = "github:pialtor/tg-ws-proxy-flake";
  };

  outputs =
    inputs:
    let
      var = {
        user = "jsus";
        dotConfig = "/home/${var.user}/.config";
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
