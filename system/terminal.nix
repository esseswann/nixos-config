{ var, pkgs, ... }:
{
  programs.fish.enable = true;

  users.users.${var.user} = {
    shell = pkgs.fish;
  };
  environment.systemPackages = with pkgs; [ alacritty ];
}
