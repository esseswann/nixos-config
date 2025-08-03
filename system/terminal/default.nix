{ var, pkgs, ... }:

let
  # Define the Alacritty config as a Nix string → turned into a file
  filename = "alacritty.toml";
  alacrittyConfig = pkgs.writeText filename (builtins.readFile ./${filename});
in
{
  system.activationScripts.alacritty = {
    text = ''
      mkdir -p /home/${var.user}/.config/alacritty

      cp ${alacrittyConfig} /home/${var.user}/.config/alacritty/${filename}

      chown -R ${var.user}:users /home/${var.user}/.config/alacritty
    '';
  };
  programs.fish.enable = true;

  users.users.${var.user} = {
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ alacritty ];
}
