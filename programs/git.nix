{ var, ... }:
{
  programs.git = {
    enable = true;
    config = {
      user.name = var.user;
      user.email = "a.lebedev@itcanfly.org";
    };
  };
}
