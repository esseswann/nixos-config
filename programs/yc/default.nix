{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  glibc,
}:

let
  version = "0.139.0"; # Update this when a new stable version is released

  sources = {
    "x86_64-linux" = {
      url = "https://storage.yandexcloud.net/yandexcloud-yc/release/${version}/linux/amd64/yc";
      sha256 = "sha256:0v03lcbz4vp707pblx27khvm6j3xr50fxrv8ic22vcgvb7s5n2kp";
    };
    "aarch64-linux" = {
      url = "https://storage.yandexcloud.net/yandexcloud-yc/release/${version}/linux/arm64/yc";
      sha256 = ""; # Run `nix-prefetch-url <url>` to fill this
    };
  };

  source =
    sources.${stdenv.hostPlatform.system}
      or (throw "Unsupported system: ${stdenv.hostPlatform.system}");
in
stdenv.mkDerivation {
  pname = "yc";
  inherit version;

  src = fetchurl {
    url = source.url;
    sha256 = source.sha256;
  };

  nativeBuildInputs = lib.optionals stdenv.isLinux [ autoPatchelfHook ];
  buildInputs = lib.optionals stdenv.isLinux [ glibc ];

  dontUnpack = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src $out/bin/yc
    chmod +x $out/bin/yc

    runHook postInstall
  '';

  meta = with lib; {
    description = "Yandex Cloud CLI tool";
    homepage = "https://cloud.yandex.com/en/docs/cli/";
    license = licenses.mit;
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
    mainProgram = "yc";
  };
}
