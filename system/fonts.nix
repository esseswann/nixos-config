{ pkgs, ... }: {
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [ fira-code fira-code-symbols ];
  };
}