{stdenv, ...}:
stdenv.mkDerivation {
  name = "sketchybar-conf";
  src = ./conf;
  unpackPhase = ":";
  buildPhase = ''
    cp -r $src/* .
    chmod -R +w .
    make -C helpers
  '';
  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';
}
