{ var, pkgs, ... }:

let
  # Define the Alacritty config as a Nix string → turned into a file
  filename = "alacritty.toml";
  path = "${var.dotConfig}/alacritty";
in
{
  system.activationScripts.alacritty = {
    text = ''
      mkdir -p ${path}
      ln -sf /etc/nixos/programs/alacritty/${filename} ${path}/${filename}
    '';
  };
  programs.fish.enable = true;

  users.users.${var.user} = {
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [ alacritty ];
}
