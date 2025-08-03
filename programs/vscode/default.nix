{ pkgs, var, ... }:
let
  settings = pkgs.writeText "settings.json" (builtins.readFile ./settings.json);
  # extensions = import ./extensions.nix { inherit pkgs; };
in
{
  system.activationScripts.vscode = {
    text = ''
      mkdir -p /home/${var.user}/.config/Code/User

      cp ${settings} /home/${var.user}/.config/Code/User/settings.json

      chown -R ${var.user}:users /home/${var.user}/.config/Code
    '';
  };

  environment.systemPackages = with pkgs; [
    vscode
  ];
  # ++ extensions;
}
