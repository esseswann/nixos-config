{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "yandex-browser-stable-24.4.1.915-1"
    ];
    allowUnfree = true;
  };
}