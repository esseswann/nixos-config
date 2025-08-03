{ var, pkgs, ... }:

let
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

  users.users.${var.user}.shell = pkgs.fish;

  environment.systemPackages = with pkgs; [ alacritty ];
}
