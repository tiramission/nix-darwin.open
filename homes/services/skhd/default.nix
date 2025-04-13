{...}: {
  services.skhd = {
    enable = true;
    config = ./skhdrc;
  };
}
