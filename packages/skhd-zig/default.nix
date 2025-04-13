{
  stdenv,
  fetchurl,
  gnutar,
  gzip,
  zlib,
  lib,
  system,
}:
stdenv.mkDerivation rec {
  pname = "shkd";
  version = "0.0.12";
  src = fetchurl {
    url = "https://github.com/jackielii/skhd.zig/releases/download/v${version}/skhd-arm64-macos.tar.gz";
    sha256 = "sha256-x97yoG1PTvKPfbDvCMRJ3DW/qfSrw1XDJ7ZCJoVa3DQ=";
  };
  unpackPhase = ":";
  installPhase = ''
    mkdir -p $out/bin
    ${gnutar}/bin/tar -xzf $src
    mv skhd-arm64-macos $out/bin/skhd
  '';
}
