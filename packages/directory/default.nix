{
  stdenv,
  src ? null,
  ...
}:
stdenv.mkDerivation {
  name = "directory";
  src = src;
  unpackPhase = ":";
  installPhase = ''
    mkdir -p $out
    cp -r $src/* $out/
  '';
}
