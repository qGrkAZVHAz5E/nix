{ config, lib, pkgs, ... }: {
  home.packages = with pkgs; [
    # Gaming
    wine
    lutris
  ];
}
