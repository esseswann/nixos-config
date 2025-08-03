{ var, pkgs, ... }:

let
  # Define the Alacritty config as a Nix string → turned into a file
  filename = "alacritty.toml";
  path = "${var.dotConfig}/alacritty";
  alacrittyConfig = pkgs.writeText filename (builtins.readFile ./${filename});
in
{
  system.activationScripts.alacritty = {
    text = ''
      mkdir -p ${path}

      cp ${alacrittyConfig} ${path}${filename}

      chown -R ${var.user}:users ${path}
    '';
  };
  programs.fish.enable = true;

  users.users.${var.user} = {
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ alacritty ];
}
