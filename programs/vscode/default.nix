{ pkgs, var, ... }:
let
  filename = "settings.json";
  path = "${var.dotConfig}/Code/User";
  # extensions = import ./extensions.nix { inherit pkgs; };
in
{
  system.activationScripts.vscode = {
    text = ''
      mkdir -p ${path}
      ln -sf /etc/nixos/programs/vscode/${filename} ${path}/${filename}
    '';
  };

  environment.systemPackages = with pkgs; [
    vscode
  ];
  # ++ extensions;
}
