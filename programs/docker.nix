{ var, ... }:
{
  virtualisation.docker.enable = true;
  users.users.${var.user}.extraGroups = [ "docker" ];
}
