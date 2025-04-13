{stdenv, ...}:
stdenv.mkDerivation {
  name = "empty";
  unpackPhase = ":";
  installPhase = ''
    install -d $out
  '';
}
